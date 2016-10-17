require 'rails_helper'

feature 'User creates fridge' do
  let!(:user) { FactoryGirl.create(:user) }
  context 'As an authenticated user' do
    scenario 'I can navigate to a page to create a new fridge' do
      visit '/fridge/new'

      expect(current_path).to eq(new_fridge_path)
    end

    scenario 'I cannot create a new fridge if I am not logged in' do
      visit new_fridge_path

      expect(page).to have_content('Please sign in')
    end

    scenario 'I must provide a name to create the fridge' do
      user_sign_in(user)
      visit new_fridge_path
      fill_in 'Name', with: 'My Fridge'
      click_button 'Save Fridge'

      expect(page).to have_content 'Fridge added successfully'
      expect(page).to have_content 'My Fridge'

    end

    scenario 'I expect an error if I don\'t provide a name' do
      user_sign_in(user)
      visit new_fridge_path
      click_button 'Save Fridge'

      expect(page).to have_content('Name can\'t be blank')

    end
  end
end
