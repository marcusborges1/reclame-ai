FactoryBot.define do
  factory :complaint do
    name            { 'Harry Potter' }
    email           { 'harry_potter@hogwarts.com' }
    phone_number    { '61912345678' }
    description     { 'My new firebolt is not working' }
    trust_rating    { 'not_verified' }
    order_number    { '123' }
    delivery_cep    { '01001000' }

    sale
  end
end