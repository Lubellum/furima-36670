FactoryBot.define do
  factory :purchase_mailing do
    address = Gimei.address

    postal_code          { '123-4567' }
    ship_from_address_id { 2 }
    municipalities       { address.kanji }
    street_number        { address.kanji }
    building_name        { 'マルコポーロ333' }
    telephone_number     { Faker::Number.between(from: 1234567890, to: 12345678901) }
  end
end
