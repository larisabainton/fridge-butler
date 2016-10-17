require 'rails_helper'

feature 'view fridge' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:fridge) { FactoryGirl.create(:fridge, user_id: user.id ) }
  let!(:dairy) { FactoryGirl.create(:fridgecategory, fridge_id: fridge.id) }
  let!(:vegetables) { FactoryGirl.create(:fridgecategory, name: 'Vegetables', fridge_id: fridge.id) }
  let!(:meat) { FactoryGirl.create(:fridgecategory, name: 'Meat') }

  before(:each) do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_on 'My Fridge'
  end

  context 'As a user' do
    scenario 'I can see the name of my fridge on the show page' do
      expect(page).to have_content(fridge.name)
    end

    scenario 'I can see the food categories on the show page of my fridge' do
      expect(page).to have_content(dairy.name)
      expect(page).to have_content(vegetables.name)
    end

    scenario 'I don\'t see food categories on the show page of my fridge that I didn\'t create' do
      expect(page).not_to have_content(meat.name)
    end

    scenario 'I can add new food categories on the show page of my fridge' do
    end
  end
end
