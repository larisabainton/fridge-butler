require 'rails_helper'

feature 'send email' do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:fridge) { FactoryGirl.create(:fridge, user_id: user.id ) }
  let!(:fridgecategory) { FactoryGirl.create(:fridgecategory, name: 'Vegetables', fridge_id: fridge.id) }
  let!(:date) { 2.day.from_now.strftime('%Y-%m-%d') }
  let!(:grocery) { FactoryGirl.create(:grocery, fridgecategory_id: fridgecategory.id, exp_date: date)}

  context 'As a user' do
    pending scenario 'I get an email if it is 2 days before my food expires' do
      ActionMailer::Base.deliveries = []

      expect(ActionMailer::Base.deliveries.size).to eq(1)
      last_email = ActionMailer::Base.deliveries.last
    end
  end
end
