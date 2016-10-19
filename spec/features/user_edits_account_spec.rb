require 'rails_helper'

feature 'edit user account' do
  let(:user) { FactoryGirl.create(:user) }
  let!(:other_user) { FactoryGirl.create(:user) }

  before(:each) do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  context 'As a user' do
    scenario 'I can edit my user information' do
      visit user_path(user)
      click_link 'Edit'

      fill_in 'First name', with: 'Carl'
      click_button 'Save Changes'

      expect(page).to have_content('Profile edited successfully')
      expect(page).to have_content('Carl Smith')
      expect(page).not_to have_content('John')
    end

    scenario 'I must provide valid information' do
      visit edit_user_path(user)
      fill_in 'First name', with: ''
      click_button 'Save Changes'

      expect(page).to have_content('First name can\'t be blank')
    end

    scenario 'I cannot edit anyone else\'s profile' do
      visit edit_user_path(other_user)

      expect(page).to have_content('You can only edit your own profile')
    end
  end
end
