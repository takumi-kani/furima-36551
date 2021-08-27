FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {'111aaa'}
    password_confirmation {password}
    last_name             {'可児'}
    first_name            {'匠'}
    last_name_kana        {'カニ'}
    first_name_kana       {'タクミ'}
    birth_date            {Faker::Date.in_date_period}
  end
end