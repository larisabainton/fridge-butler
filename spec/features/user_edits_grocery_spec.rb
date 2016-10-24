require 'rails_helper'

feature 'sign up' do
  let!(:user) { FactoryGirl.create(:user, email: 'example@example.com') }
  let!(:other_user) { FactoryGirl.create(:user) }
  let!(:fridge) { FactoryGirl.create(:fridge, user_id: user.id) }
  let!(:fridgecategory) { FactoryGirl.create(:fridgecategory, fridge_id: fridge.id) }
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

  context 'As a user' do
    scenario 'I can edit my grocery' do
      old_name = grocery.name
      click_link grocery.name

      expect(page).to have_xpath('//a[contains(., edit)]')

      fill_in 'Enter a name', with: 'New Grocery Name'
      click_button 'Save Grocery'

      expect(page).to have_content('New Grocery Name')
      expect(page).to_not have_content(old_name)
    end

    scenario 'I must input valid info to my grocery' do
      click_link grocery.name

      fill_in 'Enter a name', with: ''
      click_button 'Save Grocery'

      expect(page).to have_content('Name can\'t be blank')
    end

    scenario 'I can delete my grocery' do
      within "div.delete-grocery" do
        click_link ''
      end

      expect(page).to_not have_content(grocery.name)
    end

    scenario 'I can\'t edit anyone else\'s grocery' do
      visit edit_grocery_path(other_grocery)

      expect(page).to have_content('You cannot edit this grocery')
    end
  end
end
