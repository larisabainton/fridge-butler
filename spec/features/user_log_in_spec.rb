require 'rails_helper'

feature 'log in' do
  let!(:user) { FactoryGirl.create(:user) }
  context 'As a user' do
    scenario 'I can log in if I already have an account' do
      visit root_path
      click_link 'Log In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      expect(page).to have_content('Signed in successfully')
    end

    scenario 'I can log out' do
      visit root_path
      click_link 'Log In'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      click_link 'Log Off'

      # expect(page).to have_content('Signed out successfully')

    end
  end
end
