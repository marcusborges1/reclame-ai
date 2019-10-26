FactoryBot.define do
  factory :sale do
    sequence(:order_number) { |number| "10#{number}" }
    total_value             { 500_00 }
  end
end