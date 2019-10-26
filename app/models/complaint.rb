class Complaint < ApplicationRecord
  belongs_to :sale

  validates_presence_of :name, :email, :description
end