require 'rails_helper'

feature 'As a new user I can create a mealbook' do
  scenario 'when filling in valid information' do
    user = create(:user)
    login_as user

    visit root_path
    fill_in "mealbook[mealbook_name]", with: "Adams Family"
    click_button "Create"

    expect(page).to have_content "Adams Family"
  end
end
