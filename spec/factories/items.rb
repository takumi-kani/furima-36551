FactoryBot.define do
  factory :item do
    name                  {'サンプル'}
    info                  {Faker::Lorem.sentence}
    category_id           {1}
    sales_status_id       {1}
    shipping_fee_id       {1}
    prefecture_id         {1}
    scheduled_delivery_id {1}
    price                 {Faker::Number.number(digits: 7)}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
