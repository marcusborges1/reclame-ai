require 'rails_helper'

RSpec.describe DetermineComplaintSafetyJob, type: :job do
  describe '#coordinates_of(delivery_cep)' do
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

  describe '#perform(*args)' do
  end
end
