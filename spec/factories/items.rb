FactoryBot.define do
  factory :item do
    sequence(:name)     { |n| "Product #{n}" }
    description         { 'A great product' }
    barcode             { '7894900053562' }
    price               { 1050 }
    available_quantity  { 40 }
  end
end