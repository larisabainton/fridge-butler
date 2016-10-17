require 'rails_helper'

feature 'view fridge' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:fridge) { FactoryGirl.create(:fridge, user_id: user.id ) }
  context 'As a user' do
    before(:each) do
      visit root_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
      click_on 'My Fridge'
    end

    scenario 'I can see the name of my fridge on the show page' do
    end

    scenario 'I can see the food categories on the show page of my fridge' do
    end

    scenario 'I can add new food categories on the show page of my fridge' do
    end
  end
end
