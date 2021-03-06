FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name

    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name_kanji      { japanese_user.first.kanji }
    last_name_kanji       { japanese_user.last.kanji }
    first_name_katakana   { japanese_user.first.katakana }
    last_name_katakana    { japanese_user.last.katakana }
    birth_date            { Faker::Date.between(from: '1930-01-01', to: Date.today) }
  end
end
