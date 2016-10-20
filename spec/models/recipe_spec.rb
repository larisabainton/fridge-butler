require 'rails_helper'

describe Recipe, type: :model do
  it { should have_valid(:title).when('Name', 'Other Recipe Name') }
  it { should_not have_valid(:title).when(nil, '') }
end
