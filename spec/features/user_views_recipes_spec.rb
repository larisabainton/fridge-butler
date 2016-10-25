require 'rails_helper'
require 'spec_helper'

feature 'view recipes', vcr: true do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:fridge) { FactoryGirl.create(:fridge, user_id: user.id ) }
  let!(:dairy) { FactoryGirl.create(:fridgecategory, fridge_id: fridge.id) }
  let!(:vegetables) { FactoryGirl.create(:fridgecategory, name: 'Vegetables', fridge_id: fridge.id) }
  let!(:meat) { FactoryGirl.create(:fridgecategory, name: 'Meat') }
  let!(:milk) { FactoryGirl.create(:grocery, fridgecategory_id: dairy.id) }
  let!(:cheese) { FactoryGirl.create(:grocery, name: 'Cheese', fridgecategory_id: dairy.id) }

  before(:each) do
    visit root_path
    click_link 'LOG IN'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_on 'Recipes'
  end

  context 'As a user' do

    scenario 'I see only the groceries that I have' do
      expect(page).to have_content(milk.name)
      expect(page).to have_content(cheese.name)
      expect(page).to_not have_content(meat.name)
    end

    pending scenario 'I can select which groceries I want to search' do
      check milk.name
      check cheese.name
      click_button 'Find Recipes'

      expect(page).to_not have_content('Error')
      expect(page).to have_content('HELP HOW DO I STUB')
    end

    pending scenario 'I get back a list of recipes' do
      expect(page).to have_content(milk.name)
      expect(page).to have_content(cheese.name)
      expect(page).to have_content('HELP HOW DO I STUB')
    end
  end
end
