FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.email }
    password { "1a#{Faker::Internet.password(min_length: 6)}" }
    password_confirmation { password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    first_name_kana { Faker::Japanese::Name.first_name }
    last_name_kana { Faker::Japanese::Name.last_name }
    birthday { Faker::Date.backward }
  end
end
