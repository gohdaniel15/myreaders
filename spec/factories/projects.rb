FactoryGirl.define do
  factory :project do
    association :facilitator, factory: :facilitator, strategy: :build
    sequence(:name) { |n| "Project #{n}" }
    location 'Location X'
    start_on { Date.current.to_s }
    end_on { (Date.current + 17.weeks).to_s }
    status 1

    trait :invalid do
      name nil
      location nil
      start_on nil
      status 1
    end

    trait :inactive do
      status 0
    end

  end
end
