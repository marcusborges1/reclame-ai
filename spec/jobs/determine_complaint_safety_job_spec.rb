require 'rails_helper'

RSpec.describe DetermineComplaintSafetyJob, type: :job do
  describe '#coordinates_of(delivery_cep)' do
    context 'with a valid cep' do
      let(:delivery_cep) { '01001000' }

      before do
        stub_request(:get, "https://viacep.com.br/ws/#{delivery_cep}/json").
          to_return(body: '{
            "cep": "01001-000",
            "logradouro": "Praça da Sé",
            "complemento": "lado ímpar",
            "bairro": "Sé",
            "localidade": "São Paulo",
            "uf": "SP",
            "unidade": "",
            "ibge": "3550308",
            "gia": "1004"
          }')
      end

      it 'returns an array with [latitude, longitude] of given cep' do
        job = DetermineComplaintSafetyJob.new
        expect(job.coordinates_of(delivery_cep)).to match_array([-23.5511736, -46.6340015])
      end
    end

    context 'with an invalid cep' do
      let(:delivery_cep) { '12345678' }

      before do
        stub_request(:get, "https://viacep.com.br/ws/#{delivery_cep}/json").
          to_return(body: '{"erro": true}')
      end

      it 'raises an ViaCep::ApiRequestError' do
        job = DetermineComplaintSafetyJob.new
        expect { job.coordinates_of(delivery_cep) }.to raise_error(ViaCep::ApiRequestError)
      end
    end
  end

  describe '#perform(request_ip, complaint)' do
    let(:complaint)   { create(:complaint) }
    let(:request_ip)  { '164.41.76.162' }
    let(:job)         { DetermineComplaintSafetyJob.new }

    context 'when distance between request_ip and delivery_cep coordinates are <= 150 km' do
      before do
        allow(IpGeolocation).to receive(:fetch_latitude_and_longitude).
          and_return(['-23.5503099','-46.6363896'])

        allow(job).to receive(:coordinates_of).
          and_return(['-23.6137715','-46.6924706'])
      end

      it 'updates complaint trust_rating to :safe' do
        job.perform(request_ip, complaint)
        complaint.reload
        expect(complaint.trust_rating).to eq('safe')
      end
    end

    context 'when distance between request_ip and delivery_cep coordinates are > 150 km' do
      before do
        allow(IpGeolocation).to receive(:fetch_latitude_and_longitude).
          and_return(['-23.5503099','-46.6363896'])

        allow(job).to receive(:coordinates_of).
          and_return(['-15.7877054','-47.8789594'])
      end

      it 'updates complaint trust_rating to :suspect' do
        job.perform(request_ip, complaint)
        complaint.reload
        expect(complaint.trust_rating).to eq('suspect')
      end
    end
  end
end
