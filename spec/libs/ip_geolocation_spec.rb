require 'rails_helper'
require 'ip_geolocation'
require 'exceptions'

RSpec.describe IpGeolocation do

  describe '.fetch(request_ip)' do
    before do
      stub_request(:get, /api.ipgeolocation.io/)
        .to_return(body: '{"latitude": "-15.67410", "longitude": "-48.19990"}')
    end

    context 'with a valid request_ip' do
      it 'returns a hash with latitude' do
        expect(IpGeolocation.fetch('164.41.76.162')['latitude']).to eq('-15.67410')
      end

      it 'returns a hash with longitude' do
        expect(IpGeolocation.fetch('164.41.76.162')['longitude']).to eq('-48.19990')
      end
    end

    context 'with a invalid request_ip' do
      before do
        stub_request(:get, /api.ipgeolocation.io/)
          .to_return(status: 404, body: '{"message": "Some error message"}')
      end

      it 'raises an ApiRequestError' do
        expect { IpGeolocation.fetch('1') }.to raise_error(ApiRequestError)
      end
    end
  end
end