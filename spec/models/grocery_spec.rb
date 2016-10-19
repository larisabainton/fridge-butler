require 'rails_helper'

describe Grocery, type: :model do

  it { should have_valid(:name).when('Kale', 'Strawberry') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:quantity).when(1, 2, nil) }
  it { should_not have_valid(:quantity).when('','hello', 1.5) }

  it { should have_valid(:exp_date).when('May 1', 'July 23') }
  it { should_not have_valid(:exp_date).when(nil, '') }

  it { should have_valid(:fridgecategory_id).when(1, 2) }
  it { should_not have_valid(:fridgecategory_id).when(nil, '', 'hello', 1.5) }

end
