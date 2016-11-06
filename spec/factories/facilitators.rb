FactoryGirl.define do
  factory :facilitator do
    sequence(:name) { |n| "Facilitator #{n}" }
  end
end
