FactoryBot.define do
  factory :item do
    item_name               { Faker::Lorem.characters(number: 40) }
    explanation             { Faker::Lorem.characters(number: 1000) }
    category_id             { 2 }
    condition_id            { 2 }
    delivery_fee_payment_id { 2 }
    ship_from_address_id    { 2 }
    ship_to_duration_id     { 2 }
    price                   { Faker::Number.between(from: 300, to: 9999999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    association :user
  end
end
