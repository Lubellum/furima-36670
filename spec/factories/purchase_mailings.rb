FactoryBot.define do
  factory :purchase_mailing do
    address = Gimei.address

    postal_code          { '123-4567' }
    ship_from_address_id { 2 }
    municipalities       { address.kanji }
    street_number        { address.kanji }
    building_name        { 'マルコポーロ333' }
    telephone_number     { Faker::Number.between(from: 1_000_000_000, to: 99_999_999_999) }
    token                {"tok_abcdefghijk00000000000000000"}
  end
end
