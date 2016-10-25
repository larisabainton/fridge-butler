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

  scenario 'I can edit the name of my grocerylist' do
    click_link grocerylist.name
    fill_in 'Name', with: 'New Grocerylist Name'
    click_button 'Save Grocery List'

    expect(page).to have_content('Grocery List edited successfully')
    expect(page).to have_content('New Grocerylist Name')
  end

  scenario 'I must provide a name when editing' do
    click_link grocerylist.name
    fill_in 'Name', with: ''
    click_button 'Save Grocery List'

    expect(page).to have_content('Name can\'t be blank')
  end
end
