require 'rails_helper'

feature 'As a new user I can sign up' do
  scenario 'when filling in valid information' do
    visit new_user_registration_path
    fill_in "Email", with: "example@email.com"
    fill_in "Username", with: "example123"
    fill_in "Password", with: "password123"

    click_button "Sign up"

    expect(page).to have_content "MealBooks"

  end
end
