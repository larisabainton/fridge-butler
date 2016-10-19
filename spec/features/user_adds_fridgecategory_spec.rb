require 'rails_helper'

feature 'add fridgecategory' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:fridge) { FactoryGirl.create(:fridge, user_id: user.id ) }
  let!(:dairy) { FactoryGirl.create(:fridgecategory, fridge_id: fridge.id) }
  let!(:vegetables) { FactoryGirl.create(:fridgecategory, name: 'Vegetables', fridge_id: fridge.id) }
  let!(:meat) { FactoryGirl.create(:fridgecategory, name: 'Meat') }
  let!(:milk) { FactoryGirl.create(:grocery, fridgecategory_id: dairy.id) }
  let!(:cheese) { FactoryGirl.create(:grocery, name: 'Cheese', fridgecategory_id: dairy.id) }

  before(:each) do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_on 'My Fridge'
  end

  context 'As a user' do
    scenario 'I can add new food categories on the show page of my fridge' do
      fill_in 'Name', with: 'Fruits'
      click_button 'Save Category'

      expect(page).to_not have_content('Please sign in')
      expect(page).to have_content('Category added successfully')
    end

    scenario 'I get an error if I don\'t provide a name' do
      click_button 'Save Category'

      expect(page).to have_content('Name can\'t be blank')
    end

    scenario 'I must be logged in to create a fridge category' do
      click_link 'Log Off'
      visit '/fridgecategories/new'

      expect(page).to have_content('Please sign in')
    end
  end
end
