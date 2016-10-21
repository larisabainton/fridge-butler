FactoryGirl.define do
  factory :grocery do
    name 'Milk'
    quantity 1
    exp_date 'May 1, 2017'
    fridgecategory_id 1
    grocerylist_id nil
  end
end
