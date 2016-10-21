require 'rails_helper'

describe Grocerylist, type: :model do
  it { should have_valid(:name).when('Grocery', 'Grocery List') }
  it { should_not have_valid(:name).when(nil, '') }
end
