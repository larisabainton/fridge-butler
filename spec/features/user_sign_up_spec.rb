require 'rails_helper'

feature 'sign up' do
  let!(:user) { FactoryGirl.create(:user, email: 'example@example.com') }

  context 'As a user' do
    scenario 'I see a signup button on the home page' do
      visit root_path

      expect(page).to have_content('SIGN UP')
    end

    scenario 'I can click on the sign up button' do
      visit root_path
      click_link 'SIGN UP'

      expect(page).to have_content('Password')
      expect(page).to have_content('Email')
    end

    scenario 'I can enter my information and sign up' do
      visit root_path
      click_link 'SIGN UP'
      fill_in 'First Name', with: 'John'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'Email', with: 'example2@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password Confirmation', with: 'password'
      click_button 'Sign up'

      expect(page).to have_content('Welcome! You have signed up successfully.')
    end

    scenario 'I can\'t enter an email already in the system' do
      visit root_path
      click_link 'SIGN UP'
      fill_in 'First Name', with: 'John'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'Email', with: 'example@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password Confirmation', with: 'password'
      click_button 'Sign up'

      expect(page).to have_content('Email has already been taken')
    end

    scenario 'I can\'t enter a password confirmation that doesn\'t match' do
      visit root_path
      click_link 'SIGN UP'
      fill_in 'First Name', with: 'John'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'Email', with: 'example3@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password Confirmation', with: 'passward'
      click_button 'Sign up'

      expect(page).to have_content('Password confirmation doesn\'t match')
    end

    scenario 'I can\'t enter a password that is too short' do
      visit root_path
      click_link 'SIGN UP'
      fill_in 'First Name', with: 'John'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'Email', with: 'example4@example.com'
      fill_in 'Password', with: 'pass'
      fill_in 'Password Confirmation', with: 'pass'
      click_button 'Sign up'

      expect(page).to have_content('Password is too short')
    end

    scenario 'After I sign up, I am sent to a page to create my fridge' do
      visit root_path
      click_link 'SIGN UP'
      fill_in 'First Name', with: 'John'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'Email', with: 'example5@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password Confirmation', with: 'password'
      click_button 'Sign up'

      expect(page).to have_xpath('//a[contains(., fridges)]')
      expect(page).to have_content('Now...Give Your Fridge a Name!')
    end

    scenario 'If I don\'t sign up, I can\'t make a fridge' do
      visit '/fridges/new'

      expect(page).to have_content('Please sign in')
    end

    scenario 'I must provide a name to create the fridge' do
      visit root_path
      click_link 'SIGN UP'
      fill_in 'First Name', with: 'John'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'Email', with: 'example6@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password Confirmation', with: 'password'
      click_button 'Sign up'
      fill_in 'Name', with: 'My Fridge'
      click_button 'Save Fridge'

      expect(page).to have_content 'Fridge created successfully'
      expect(page).to have_content 'Name Your Grocery List'
    end

    scenario 'I must provide a name to create the Grocery List' do
      visit root_path
      click_link 'SIGN UP'
      fill_in 'First Name', with: 'John'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'Email', with: 'example6@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password Confirmation', with: 'password'
      click_button 'Sign up'
      fill_in 'Name', with: 'My Fridge'
      click_button 'Save Fridge'
      fill_in 'Name', with: 'Grocery List'
      click_button 'Save Grocery List'

      expect(page).to have_content 'Grocery list created successfully'
      expect(page).to have_content 'Add some categories'
    end

    scenario 'If I don\'t provide a name when creating my grocery list, I get an error' do
      visit root_path
      click_link 'SIGN UP'
      fill_in 'First Name', with: 'John'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'Email', with: 'example6@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password Confirmation', with: 'password'
      click_button 'Sign up'
      fill_in 'Name', with: 'My Fridge'
      click_button 'Save Fridge'
      fill_in 'Name', with: ''
      click_button 'Save Grocery List'

      expect(page).to have_content 'Name can\'t be blank'
    end

    scenario 'I must be signed in to create my grocery list' do
      visit root_path
      click_link 'SIGN UP'
      fill_in 'First Name', with: 'John'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'Email', with: 'example6@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password Confirmation', with: 'password'
      click_button 'Sign up'
      fill_in 'Name', with: 'My Fridge'
      click_button 'Save Fridge'
      click_link 'LOG OFF'
      visit '/grocerylists/new'

      expect(page).to have_content('Please sign in')
    end

    scenario 'I expect an error if I don\'t provide a name for my fridge' do
      visit root_path
      click_link 'SIGN UP'
      fill_in 'First Name', with: 'John'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'Email', with: 'example5@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password Confirmation', with: 'password'
      click_button 'Sign up'
      fill_in 'Name', with: ''
      click_button 'Save Fridge'

      expect(page).to have_content('Name can\'t be blank')
    end

    scenario 'I can create a foodcategory after I create my fridge' do
      visit root_path
      click_link 'SIGN UP'
      fill_in 'First Name', with: 'John'
      fill_in 'Last Name', with: 'Smith'
      fill_in 'Email', with: 'example6@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password Confirmation', with: 'password'
      click_button 'Sign up'
      fill_in 'Name', with: 'My Fridge'
      click_button 'Save Fridge'
      fill_in 'Name', with: 'Grocery List'
      click_button 'Save Grocery List'
      check 'Dairy'
      check 'Fruits'
      click_button 'Add Categories'

      expect(page).to have_content('My Fridge')
      expect(page).to have_content('Dairy')
      expect(page).to have_content('Fruits')
    end
  end
end
