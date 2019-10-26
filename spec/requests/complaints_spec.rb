require 'rails_helper'

RSpec.describe 'Complaints API', type: :request do
  describe 'GET /' do
    before { get '/' }

    it 'returns a successful response' do
      expect(response).to be_successful
    end

    it 'returns a sucessful response' do
      expect(response.body).to include('Reclame aí')
    end
  end

  describe 'POST /complaints' do
    context 'with valid params' do
      let(:valid_attributes) {
        {
          complaint: {
            name: 'Uriel Silva',
            email: 'uriel@foo.bar',
            phone_number: '61912345678',
            order_number: '123',
            delivery_cep: '70364400',
            description: 'My product is not working :('
          }
        }
      }

      before { create(:sale, order_number: '123') }

      it 'returns a successful response' do
        post '/complaints', params: valid_attributes
        expect(response).to be_successful
      end

      it 'creates a new complaint' do
        expect { post '/complaints', params: valid_attributes }
          .to change { Complaint.count }.by(1)
      end
    end
  end
end