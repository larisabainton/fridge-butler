require "rails_helper"

feature "user adds fridge category" do
  let(:fridge) { FactoryGirl.create(:fridge) }

  context "As a user" do
    scenario "I can create a new fridgecategory" do
      visit video_path(video)
      within "div.new-comment" do
        fill_in "Title", with: "Eh, it was alright."
        fill_in "Content", with: "You can probably skip this one."
        click_button "Create Comment"
      end
      expect(page).to have_content("Thank you for your input!")
    end
  end
end
