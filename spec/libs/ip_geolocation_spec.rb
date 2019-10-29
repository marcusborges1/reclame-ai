require 'rails_helper'
require 'ip_geolocation'
require 'exceptions'

RSpec.describe IpGeolocation do

  describe '.fetch(request_ip)' do
    context 'with a valid request_ip' do
      before do
        stub_request(:get, /api.ipgeolocation.io/)
          .to_return(body: '{"latitude": "-15.67410", "longitude": "-48.19990"}')
      end

      it 'returns an array with [latitude, longitude]' do
        expect(IpGeolocation.fetch_latitude_and_longitude('164.41.76.162'))
          .to match_array(['-15.67410', '-48.19990'])
      end
    end

    context 'with a invalid request_ip' do
      before do
        stub_request(:get, /api.ipgeolocation.io/)
          .to_return(status: 404, body: '{"message": "Some error message"}')
      end

      it 'raises an ApiRequestError' do
        expect { IpGeolocation.fetch_latitude_and_longitude('1') }
          .to raise_error(ApiRequestError)
      end
    end
  end
end