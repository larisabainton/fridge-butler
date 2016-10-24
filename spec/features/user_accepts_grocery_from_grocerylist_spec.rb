require 'rails_helper'

feature 'accepts groceries' do
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
    scenario 'I see an accept button on the page' do
      expect(page).to have_content('Accept')
    end

    pending scenario 'When I click the accept button on the page, I must fill in an expiration date' do
      click_link 'Accept'

      expect(page).to have_content('Expiration Date')
    end

    scenario 'When I click the accept button on the page, the grocery disappears from the grocerylist page' do
      click_link 'Accept'

      expect(page).to_not have_content(grocery.name)
    end

    scenario 'When I click the accept button, the grocery appears on the fridge page' do
      click_link 'Accept'
      click_link 'fridgeBUTLER'
      click_link 'My Fridge'

      expect(page).to have_content(grocery.name)
    end
  end
end
