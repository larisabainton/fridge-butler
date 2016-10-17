require 'rails_helper'

describe Fridge, type: :model do

  it { should have_valid(:name).when('John\'s Fridge', 'Sally\'s Fridge') }
  it { should_not have_valid(:name).when(nil, '') }

  it { should have_valid(:user_id).when(1, 2) }
  it { should_not have_valid(:user_id).when(nil, '', 'hello', 1.5) }

end
