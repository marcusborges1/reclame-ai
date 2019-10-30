class DetermineComplaintSafetyJob < ApplicationJob
  queue_as :default

  def coordinates_of(delivery_cep)
    location = ViaCep::Address.new(delivery_cep)
    query = "#{location.state} #{location.city} #{location.neighborhood} #{location.address}"
    geocoder_location = Geocoder.search(query).first.coordinates
  end

  def perform(delivery_cep, complaint)
  end
end
