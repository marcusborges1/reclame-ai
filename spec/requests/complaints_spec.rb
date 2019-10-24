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
end