require 'ip_geolocation'

class DetermineComplaintSafetyJob < ApplicationJob
  queue_as :default

  def coordinates_of(delivery_cep)
    location = ViaCep::Address.new(delivery_cep)
    query = "#{location.state} #{location.city} #{location.neighborhood} #{location.address}"
    geocoder_location = Geocoder.search(query).first.coordinates
  end

  def perform(request_ip, complaint)
    request_coordinates = IpGeolocation.fetch_latitude_and_longitude(request_ip)
    delivery_cep_coordinates = coordinates_of(complaint.delivery_cep)

    distance_between_locations = Geocoder::Calculations.distance_between(
      request_coordinates, delivery_cep_coordinates)

    if distance_between_locations <= 100
       complaint.update(trust_rating: :safe)
    else
      complaint.update(trust_rating: :suspect)
    end
  end
end
