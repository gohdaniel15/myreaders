FactoryGirl.define do
  factory :project do
    association :facilitator, factory: :facilitator, strategy: :build
    sequence(:name) { |n| "Project #{n}" }
    location 'Location X'
    start_on { Date.current }
    end_on { Date.current + 17.weeks }
    status 1

    trait :invalid do
      name nil
      location nil
      start_on nil
      status 1
    end
  end
end
