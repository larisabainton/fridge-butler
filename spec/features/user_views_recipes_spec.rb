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

  pending context 'As a user' do

    scenario 'I can select which groceries I want to search' do
    end

    scenario 'I get back a list of recipes' do
    end
  end
end
