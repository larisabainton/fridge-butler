require 'rails_helper'

feature 'add groceries' do
  let!(:grocerylist) { FactoryGirl.create(:grocerylist, user_id: user.id) }
  context 'As a user' do
  end
end
