require 'rails_helper'

feature 'view fridge' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user_fridge) {FactoryGirl.create(:fridge, user_id: user.id)}
  let!(:other_fridge) { FactoryGirl.create(:fridge) }
  context 'As a user' do

    scenario 'I cannot see someone else\'s fridge' do
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      click_on 'My Fridge'

      expect(page).not_to have_content(other_fridge.name)
    end

    scenario 'The link takes me to my fridge show page' do
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      click_on 'My Fridge'

      expect(page).to have_content(user_fridge.name)
    end
  end
end
