FactoryGirl.define do
  factory :admin do
    sequence(:name) { |n| "Admin #{n}" }
  end
end
