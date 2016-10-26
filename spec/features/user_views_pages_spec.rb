require 'rails_helper'

feature 'views grocerylist' do
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
  end

  scenario 'I must be signed in to get to fridge through get started link' do
    click_link 'LEARN MORE'
    click_link 'GET STARTED'

    expect(page).to have_xpath('//a[contains(., fridges)]')
  end

  scenario 'If I\'m not signed in I go to the new user session path' do
    click_link 'LOG OFF'
    click_link 'LEARN MORE'
    click_link 'GET STARTED'

    expect(page).to have_xpath('//a[contains(., users)]')
  end
end
