require 'rails_helper'

describe Fridgecategory, type: :model do

  it { should have_valid(:name).when('John\'s Fridge', 'Sally\'s Fridge') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:fridge_id).when(1, 2) }
  it { should_not have_valid(:fridge_id).when(nil, '', 'hello', 1.5) }

end
