class Sale < ApplicationRecord
  validates :order_number, presence: true,
            uniqueness: true
  validates :total_value, presence: true
end