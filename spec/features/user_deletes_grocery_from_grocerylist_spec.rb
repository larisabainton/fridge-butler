require 'rails_helper'

feature 'sign up' do
  let!(:user) { FactoryGirl.create(:user, email: 'example@example.com') }
  let!(:other_user) { FactoryGirl.create(:user) }
  let!(:other_fridge) { FactoryGirl.create(:fridge, user_id: other_user.id ) }
  let!(:fridge) { FactoryGirl.create(:fridge, user_id: user.id) }
  let!(:other_fridge) { FactoryGirl.create(:fridge, user_id: other_user.id ) }
  let!(:other_fridgecategory) { FactoryGirl.create(:fridgecategory, fridge_id: other_fridge.id)}
  let!(:fridgecategory) { FactoryGirl.create(:fridgecategory, fridge_id: fridge.id)}
  let!(:grocerylist) { FactoryGirl.create(:grocerylist, user_id: user.id) }
  let!(:other_grocerylist) { FactoryGirl.create(:grocerylist, user_id: other_user.id) }
  let!(:grocery) { FactoryGirl.create(:grocery, fridgecategory_id: fridgecategory.id, grocerylist_id: grocerylist.id)}
  let!(:other_grocery) { FactoryGirl.create(:grocery, fridgecategory_id: other_fridgecategory.id ) }

  before(:each) do
    visit root_path
    click_link 'LOG IN'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link 'Grocery List'
  end

  scenario 'I can delete a grocery from my grocerylist' do
    within 'div.delete-button' do
      click_link ''
    end

    expect(page).to_not have_content(grocery.name)
  end
end
