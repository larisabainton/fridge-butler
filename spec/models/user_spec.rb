require 'rails_helper'

RSpec.describe User, type: :model do
  let(:jon) { FactoryGirl.create(:user) }
  context "As a user" do
    scenario "I have a first name" do
      expect(user.first_name).not_to eq(nil)
    end

    scenario "I have a last name" do
      expect(user.last_name).not_to eq(nil)
    end

    scenario "I have an email" do
      expect(user.email).not_to eq(nil)
    end
  end

  # it { should have_valid(:first_name).when('John', 'Sally') }
  # it { should_not have_valid(:first_name).when(nil, '') }
  #
  # it { should have_valid(:last_name).when('Smith', 'Swanson') }
  # it { should_not have_valid(:last_name).when(nil, '') }
  #
  # it { should have_valid(:email).when('user@example.com', 'another@gmail.com') }
  # it { should_not have_valid(:email).when(nil, '', 'user',\
  #   'users@com', 'usersba.com') }
  #
  # # it { should have_valid(:avatar).when('https://profile.image.url.com/cookie.jpg')}
  #
  # it 'has a matching password confirmation for the password' do
  #   user = User.new
  #   user.password = 'password'
  #   user.password_confirmation = 'anotherpassword'
  #
  #   expect(user).to_not be_valid
  #   expect(user.errors[:password_confirmation]).to_not be_blank
  # end

end
