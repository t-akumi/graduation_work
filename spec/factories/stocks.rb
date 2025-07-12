FactoryBot.define do
  factory :stock do
    association :user
    name  {"test"}
    stock_quantity {"3"}
  end
end
