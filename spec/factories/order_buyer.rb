FactoryBot.define do
  factory :order_buyer do
    token         {'tok_abcdefghijk00000000000000000'}
    postal_code   {'111-1111'}
    prefecture_id {'2'}
    city          {Faker::Address.city}
    address       {Faker::Address.street_address}
    phone_number  {Faker::Number.number(digits: 11)}
    user_id       {FactoryBot.create(:user)}
    item_id       {FactoryBot.create(:item)}
  end
end
