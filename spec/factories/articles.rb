FactoryBot.define do
  factory :article do
    association :user
    keyword {"aaa"}
    body {"testtesttest"}
    
  end
end
