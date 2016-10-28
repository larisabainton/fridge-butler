require 'rails_helper'

describe Grocery, type: :model do

  it { should have_valid(:name).when('Kale', 'Strawberry') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:quantity).when(1, 2) }
  it { should_not have_valid(:quantity).when(nil, '','hello', 1.5) }

  it { should have_valid(:exp_date).when('Sat, 22 Oct 2016', 'Sun, 23 Oct 2016', nil) }

  it { should have_valid(:fridgecategory_id).when(1, 2) }
  it { should_not have_valid(:fridgecategory_id).when(nil, '', 'hello', 1.5) }

  it { should have_valid(:grocerylist_id).when(1, 2, nil) }

  it "should be able to check for expiration date" do
    expect(Grocery.expiration_check).to be_a_kind_of(Array)
  end

  it "should only return have groceries that are two days from now" do
    milk = Grocery.create(name: 'Milk', quantity: 1, exp_date: 2.day.from_now, fridgecategory_id: 1, grocerylist_id: nil)
    coffee = Grocery.create(name: 'Coffee', quantity: 1, exp_date: 3.day.from_now, fridgecategory_id: 1, grocerylist_id: nil)

    expect(Grocery.expiration_check).to include(milk)
    expect(Grocery.expiration_check).to_not include(coffee)
  end

end
