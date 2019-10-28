class Complaint < ApplicationRecord
  attr_accessor :order_number, :delivery_cep

  belongs_to :sale
  validates_presence_of :name, :email, :description, :order_number, :delivery_cep
end