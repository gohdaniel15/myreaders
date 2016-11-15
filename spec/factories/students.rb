FactoryGirl.define do
  factory :student do
    association :project, factory: :project, strategy: :build
    sequence(:name) { |n| "Student#{n}" }
    birthday '2016-11-06'
    class_name '1A'
    comments nil

    trait :invalid do
      name nil
      birthday nil
      class_name nil
      comments nil
    end
  end
end
