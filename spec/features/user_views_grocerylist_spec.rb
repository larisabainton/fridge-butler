require 'rails_helper'

feature 'views grocerylist' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:fridge) { FactoryGirl.create(:fridge, user_id: user.id ) }
  let!(:grocerylist) { FactoryGirl.create(:grocerylist, user_id: user.id) }
  let!(:fridgecategory) { FactoryGirl.create(:fridgecategory, fridge_id: fridge.id) }
  let!(:grocery) { FactoryGirl.create(:grocery, fridgecategory_id: fridgecategory.id, grocerylist_id: grocerylist.id)}

  before(:each) do
    visit root_path
    click_link 'LOG IN'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  context 'As a user' do
    scenario 'I can click on the link on the home page to see my grocery list' do
      click_link 'Grocery List'

      expect(page).to have_content(grocerylist.name)
      expect(page).to have_content(grocery.name)
      expect(page).to_not have_content(fridge.name)
    end
  end
end
