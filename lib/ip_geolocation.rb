require 'net/http'
require 'uri'
require 'json'

class IpGeolocation
  BASE_URL = "https://api.ipgeolocation.io".freeze

  def self.fetch_latitude_and_longitude(request_ip)
    uri = build_uri(request_ip)
    response = Net::HTTP.get_response(uri)
    parsed_body = JSON.parse(response.body)

    if response.code == '200'
      [parsed_body['latitude'], parsed_body['longitude']]
    else
      raise ApiRequestError, parsed_body['message']
    end
  end

  private

  def self.build_uri(request_ip)
    URI("#{BASE_URL}/ipgeo?apiKey=#{ENV['IP_GEOLOCATION_KEY']}&ip=#{request_ip}")
  end
end