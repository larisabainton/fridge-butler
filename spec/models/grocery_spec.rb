require 'rails_helper'

describe Grocery, type: :model do

  it { should have_valid(:name).when('Kale', 'Strawberry') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:quantity).when(1, 2) }
  it { should_not have_valid(:quantity).when(nil, '','hello', 1.5) }

  it { should have_valid(:exp_date).when('Sat, 22 Oct 2016', 'Sun, 23 Oct 2016', nil) }
  # it { should_not have_valid(:exp_date).when('', 'May 1') }

  it { should have_valid(:fridgecategory_id).when(1, 2) }
  it { should_not have_valid(:fridgecategory_id).when(nil, '', 'hello', 1.5) }

  it { should have_valid(:grocerylist_id).when(1, 2, nil) }
  # it { should_not have_valid(:grocerylist_id).when('', 'hello', 2.5) }

end
