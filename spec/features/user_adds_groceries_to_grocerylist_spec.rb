require 'rails_helper'

feature 'adds groceries to grocerylist' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:fridge) { FactoryGirl.create(:fridge, user_id: user.id ) }
  let!(:grocerylist) { FactoryGirl.create(:grocerylist, user_id: user.id) }
  let!(:fridgecategory) { FactoryGirl.create(:fridgecategory, fridge_id: fridge.id) }
  let!(:grocery) { FactoryGirl.create(:grocery, fridgecategory_id: fridgecategory.id, grocerylist_id: grocerylist.id)}

  before(:each) do
    visit root_path
    click_link 'LOG IN'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    click_link 'Grocery List'
  end

  context 'As a user' do
    scenario 'I can add new groceries on the show page of my grocerylist' do
      within "div.new-grocery" do
        fill_in 'Enter a name', with: 'Carrot'
        fill_in 'Enter an amount', with: '2'
        choose fridgecategory.name

        click_button 'Save Grocery'
      end
      expect(page).to_not have_content('Please sign in')
      expect(page).to have_content('Grocery added successfully')
    end

    scenario 'I get an error if I don\'t provide anything' do
      click_button 'Save Grocery'

      expect(page).to have_content('Name can\'t be blank, Quantity is not a number, Quantity can\'t be blank, Fridgecategory can\'t be blank, Fridgecategory is not a number')
    end

    scenario 'I get an error if I don\'t enter a quantity' do
      fill_in 'Enter a name', with: 'Carrot'
      click_button 'Save Grocery'

      expect(page).to have_content('Quantity can\'t be blank')
    end

    scenario 'I get an error if I don\'t provide a name' do
      fill_in 'Enter an amount', with: '2'
      click_button 'Save Grocery'

      expect(page).to have_content('Name can\'t be blank')
    end

    scenario 'I get an error if I don\'t provide a fridgecategory' do
      fill_in 'Enter a name', with: 'Carrot'
      fill_in 'Enter an amount', with: 2
      click_button 'Save Grocery'

      expect(page).to have_content('Fridgecategory can\'t be blank, Fridgecategory is not a number')
    end

    scenario 'After I add a grocery, it appears on the grocery list page' do
      expect(page).to have_content(grocery.name)
    end

    scenario 'After I add a grocery, it does not appear on the fridge page' do
      click_link 'fridgeBUTLER'
      click_link 'My Fridge'

      expect(page).to_not have_content(grocery.name)
    end

    scenario 'After I add a grocery, it has a grocery list id associated with it' do
      within "div.new-grocery" do
        fill_in 'Enter a name', with: 'Carrot'
        fill_in 'Enter an amount', with: '2'
        choose fridgecategory.name

        click_button 'Save Grocery'
      end

      g = Grocery.find(21)
      expect(g.grocerylist_id).to eq(grocerylist.id)
      expect(g.grocerylist_id).to_not eq(nil)
    end
  end
end
