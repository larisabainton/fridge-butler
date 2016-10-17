FactoryGirl.define do
  factory :fridge do
    sequence(:name) { |n| "John\'s #{n} Fridge" }
    user_id 1
  end
end
