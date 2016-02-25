require 'rails_helper'

feature 'As a new user I can create a meal' do

  scenario 'when filling in valid information' do
    user = create(:user)
    meal_book = create(:mealbook, owner: user)

    login_as user
    visit root_path
    click_link meal_book.mealbook_name
    click_link "New Meal"
    fill_in "Meal title", with: "BRUNCH"
    fill_in "Meal notes", with: "lots and lots of notes"
    click_button "Create Meal"

    expect(page).to have_content "BRUNCH"
  end
end
