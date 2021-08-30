FactoryBot.define do
  factory :item do
    name                  {'サンプル'}
    info                  {Faker::Lorem.sentence}
    category_id           {2}
    sales_status_id       {2}
    shipping_fee_id       {2}
    prefecture_id         {2}
    scheduled_delivery_id {2}
    price                 {Faker::Number.number(digits: 7)}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
