require 'rails_helper'

feature 'sign up' do
  let!(:user) { FactoryGirl.create(:user, email: 'example@example.com') }
  let!(:other_user) { FactoryGirl.create(:user) }
  let!(:other_fridge) { FactoryGirl.create(:fridge, user_id: other_user.id ) }
  let!(:fridge) { FactoryGirl.create(:fridge, user_id: user.id) }
  let!(:other_fridge) { FactoryGirl.create(:fridge, user_id: other_user.id ) }
  let!(:other_fridgecategory) { FactoryGirl.create(:fridgecategory, fridge_id: other_fridge.id)}
  let!(:grocery) { FactoryGirl.create(:grocery, fridgecategory_id: fridgecategory.id)}
  let!(:other_grocery) { FactoryGirl.create(:grocery, fridgecategory_id: other_fridgecategory.id ) }

  before(:each) do
    visit root_path
    click_link 'LOG IN'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link 'My Fridge'
  end
end
