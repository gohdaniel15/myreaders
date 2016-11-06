FactoryGirl.define do
  factory :facilitator do
    sequence(:name) { |n| "Facilitator #{n}" }
    sequence(:email) { |n| "facilitator#{n}@demo.com" }
    password '123123123'

    trait :invalid do
      name nil
      email nil
      password nil
    end
  end
end
