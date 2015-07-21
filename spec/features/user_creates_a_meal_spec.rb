require 'rails_helper'

feature 'As a new user I can create a meal' do
  let!(:user) { create(:user) }
  let!(:meal_book) { create(:mealbook, owner: user) }

  scenario 'when filling in valid information' do
    login_as user
    visit root_path
    click_link meal_book.mealbook_name
    click_link "New Meal"
    fill_in "Meal title", with: "BRUNCH"
    select "Monday", from: "Weekday"
    select "Dinner", from: "Meal type"
    fill_in "Meal notes", with: "lots and lots of notes"
    click_button "Create Meal"
    expect(page).to have_content "BRUNCH"
  end
end
