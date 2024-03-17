FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 2) }
    email { Faker::Internet.email }
    password { '1a1a1a1a' }
    password_confirmation { password }
    first_name { '山田' }
    last_name { '陸太郎' }
    first_name_kana { 'ヤマダ' }
    last_name_kana { 'リクタロウ' }
    birthday { Faker::Date.backward }
  end
end
