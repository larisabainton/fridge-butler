FactoryGirl.define do
  factory :fridge do
    sequence(:name) { |n| "John\'s #{n} Fridge" }
  end
end
