require 'rails_helper'

feature 'view fridge' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:user_fridge) {FactoryGirl.create(:fridge, user_id: user.id)}
  let!(:other_fridge) { FactoryGirl.create(:fridge) }

  context 'As a user' do

    scenario 'I cannot see someone else\'s fridge' do
      visit root_path

      expect(page).not_to have_content(other_fridge.name)
    end

    scenario 'I see my own fridge on the home page' do
      visit root_path

      expect(page).to have_content(user_fridge.name)
    end

    scenario 'I can click on my fridge to take me to the show page' do
      visit root_path
      click_link user_fridge.name

      expect(page).to have_content('search')
    end
  end
end
