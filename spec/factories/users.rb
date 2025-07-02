FactoryBot.define do
  factory :user do
    email           {Faker::Internet.email}
    name            {"test"}
    password        {Faker::Alphanumeric.alpha(number: 10)}
    password_confirmation {password}
  end
end
