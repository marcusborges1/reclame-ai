class Complaint < ApplicationRecord
  belongs_to :sale

  validates_presence_of :name, :email, :description, :order_number,
    :delivery_cep, :trust_rating, :request_ip

  enum trust_rating: [:not_verified, :safe, :suspect]
end