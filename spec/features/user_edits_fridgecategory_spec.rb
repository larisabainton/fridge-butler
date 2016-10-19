require 'rails_helper'

feature 'sign up' do
  let!(:user) { FactoryGirl.create(:user, email: 'example@example.com') }
  let!(:other_user) { FactoryGirl.create(:user) }
  let!(:fridge) { FactoryGirl.create(:fridge, user_id: user.id) }
  let!(:other_fridge) { FactoryGirl.create(:fridge, user_id: other_user.id ) }
  let!(:fridgecategory) { FactoryGirl.create(:fridgecategory, fridge_id: fridge.id) }
  let!(:other_fridgecategory) { FactoryGirl.create(:fridgecategory, fridge_id: other_fridge.id)}

  before(:each) do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link 'My Fridge'
  end

  context 'As a user' do
    scenario 'I can edit my fridgecategory' do
      old_name = fridgecategory.name
      click_link 'Edit Category'
      fill_in 'Name', with: 'New Category Name'
      click_button 'Save Category'

      expect(page).to have_content('New Category Name')
      expect(page).to_not have_content(old_name)
    end

    scenario 'I can delete my fridgecategory' do
      click_link 'Delete Category'

      expect(page).to_not have_content(fridgecategory.name)
    end

    scenario 'I must input valid info to my fridgecategory' do
      click_link 'Edit Category'

      fill_in 'Name', with: ''
      click_button 'Save Category'

      expect(page).to have_content('Name can\'t be blank')
    end

    scenario 'I can\'t edit anyone else\'s fridgecategory' do
      visit edit_fridgecategory_path(other_fridgecategory)

      expect(page).to have_content('You cannot edit this category')
    end
  end
end
