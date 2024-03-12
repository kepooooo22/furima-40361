FactoryBot.define do
  factory :item do
    association :user

    item_name { Faker::Name.unique.name }
    explanation { Faker::Lorem.sentence }
    category_id { create(:category).id }
    condition_id { create(:condition).id }
    postage_id { create(:postage).id }
    prefecture_id { create(:prefecture).id }
    delivery_day_id { create(:delivery_day).id }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
