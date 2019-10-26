class SubSale < ApplicationRecord
  belongs_to :sale
  belongs_to :item

  validates_presence_of :quantity, :subtotal
end