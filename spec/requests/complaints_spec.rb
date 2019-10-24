require 'rails_helper'

RSpec.describe 'Complaints API', type: :request do
  describe 'GET /' do
    it 'returns a sucessful response' do
      get '/'
      expect(response.body).to include('Reclame aí')
    end
  end
end