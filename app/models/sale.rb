class Sale < ApplicationRecord
  has_many :sub_sales
  has_many :items, through: :sub_sales

  validates :order_number, presence: true,
            uniqueness: true
  validates :total_value, presence: true
end