FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    explanation {Faker::Lorem.sentence}
    category_id {3}
    quality_id {4}
    shipping_charge_id {2}
    delivery_source_id {31}
    delivery_day_id {2}
    selling_price {44444}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
