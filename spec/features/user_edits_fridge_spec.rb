require 'rails_helper'

feature 'sign up' do
  let!(:user) { FactoryGirl.create(:user, email: 'example@example.com') }
  let!(:other_user) { FactoryGirl.create(:user) }
  let!(:other_fridge) { FactoryGirl.create(:fridge, user_id: other_user.id ) }
  let!(:fridge) { FactoryGirl.create(:fridge, user_id: user.id) }

  before(:each) do
    visit root_path
    click_link 'LOG IN'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link 'My Fridge'
  end

  context 'As a user' do
    scenario 'I can edit my fridge' do
      old_name = fridge.name
      click_link fridge.name
      fill_in 'Name', with: 'New Fridge Name'
      click_button 'Save Fridge'

      expect(page).to have_content('New Fridge Name')
      expect(page).to_not have_content(old_name)
    end

    scenario 'I can\'t edit anyone else\'s fridge' do
      visit edit_fridge_path(other_fridge)

      expect(page).to have_content('You cannot edit this fridge')
    end

    scenario 'I must input valid info to my fridge' do
      click_link fridge.name

      fill_in 'Name', with: ''
      click_button 'Save Fridge'

      expect(page).to have_content('Name can\'t be blank')
    end
  end
end
