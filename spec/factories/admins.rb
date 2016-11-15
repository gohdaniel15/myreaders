FactoryGirl.define do
  factory :admin do
    sequence(:name) { |n| "Admin #{n}" }
    sequence(:email) { |n| "admin#{n}@demo.com" }
    password '123123123'

    trait :invalid do
      name nil
      email nil
      password nil
    end
  end
end
