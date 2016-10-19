require 'rails_helper'

feature 'sign up' do
  let!(:user) { FactoryGirl.create(:user, email: 'example@example.com') }
  let!(:other_user) { FactoryGirl.create(:user) }
  let!(:fridge) { FactoryGirl.create(:fridge, user_id: user.id) }
  let!(:fridgecategory) { FactoryGirl.create(:fridgecategory, fridge_id: fridge.id) }
  let!(:grocery) { FactoryGirl.create(:grocery, fridgecategory_id: fridgecategory.id)}

  before(:each) do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  context 'As a user' do
    scenario 'I can click on a button to view my account page' do
      click_link 'My Account'

      expect(page).to have_xpath('//a[contains(., users)]')
    end

    scenario 'I can\'t see someone else\'s account page' do
      visit "/users/#{other_user.id}"

      expect(page).to have_content('You can only view your own profile')
    end

    scenario 'I can see my name, email, and password on my account' do
      click_link 'My Account'

      expect(page).to have_content(user.first_name)
      expect(page).to have_content(user.last_name)
      expect(page).to have_content(user.email)
      expect(page).to have_content('Edit')
      expect(page).to have_content('Delete')
    end


    scenario 'I can delete my account' do
      click_link 'My Account'
      click_link 'Delete'

      expect(page).to have_xpath('//a[contains(., sign_in)]')
      expect(Grocery.all).to_not include(grocery)
      expect(Fridgecategory.all).to_not include(fridgecategory)
      expect(Fridge.all).to_not include(fridge)
    end
  end
end
