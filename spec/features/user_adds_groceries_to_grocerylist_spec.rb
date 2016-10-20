require 'rails_helper'

feature 'adds groceries to grocerylist' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:fridge) { FactoryGirl.create(:fridge, user_id: user.id ) }
  let!(:grocerylist) { FactoryGirl.create(:grocerylist, user_id: user.id) }
  let!(:fridgecategory) { FactoryGirl.create(:fridgecategory, fridge_id: fridge.id) }
  let!(:grocery) { FactoryGirl.create(:grocery, fridgecategory_id: fridgecategory.id, grocerylist_id: grocerylist.id)}

  before(:each) do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link 'Grocery List'
  end

  context 'As a user' do
    scenario 'I can add new groceries on the show page of my fridge' do
      within "div.new-grocery" do
        fill_in 'Enter a name', with: 'Carrot'
        fill_in 'Enter an amount', with: '2'
        choose fridgecategory.name

        click_button 'Add Grocery'
      end
      expect(page).to_not have_content('Please sign in')
      expect(page).to have_content('Grocery added successfully')
    end

    scenario 'I get an error if I don\'t provide anything' do
      click_button 'Add Grocery'

      expect(page).to have_content('Name can\'t be blank, Quantity is not a number, Quantity can\'t be blank, Fridgecategory can\'t be blank, Fridgecategory is not a number')
    end

    scenario 'I get an error if I don\'t enter a quantity' do
      fill_in 'Enter a name', with: 'Carrot'
      click_button 'Add Grocery'

      expect(page).to have_content('Quantity can\'t be blank')
    end

    scenario 'I get an error if I don\'t provide a name' do
      fill_in 'Enter an amount', with: '2'
      click_button 'Add Grocery'

      expect(page).to have_content('Name can\'t be blank')
    end

    scenario 'I get an error if I don\'t provide a fridgecategory' do
      fill_in 'Enter a name', with: 'Carrot'
      fill_in 'Enter an amount', with: 2
      click_button 'Add Grocery'

      expect(page).to have_content('Fridgecategory can\'t be blank, Fridgecategory is not a number')
    end
  end
end
