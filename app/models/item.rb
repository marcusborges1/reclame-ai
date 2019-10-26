class Item < ApplicationRecord
  has_many :sub_sales
  has_many :sales, through: :sub_sales

  validates :name, presence: true,
            uniqueness: { case_sensitive: false }
  validates :barcode, presence: true,
            uniqueness: { case_sensitive: false }

  validates_presence_of :price, :available_quantity
end