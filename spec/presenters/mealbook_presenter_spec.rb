require 'rails_helper'

RSpec.describe MealbookPresenter do
  describe "#week_days" do
    it "should return a Weekday with meal if assigned" do
      mealbook = create :mealbook
      monday_meal = create :meal, mealbook: mealbook
      create :meal_assignment, meal: monday_meal, assigned_on: Date.today.monday
      tuesday_meal = create :meal, mealbook: mealbook
      create(
        :meal_assignment,
        meal: tuesday_meal,
        assigned_on: Date.today.monday + 1
      )

      expect(
        MealbookPresenter.new(mealbook).week_days.second.meal
      ).to eq tuesday_meal
    end
  end

  describe '#available_meals' do
    it "should return all meals available for the week" do
      mealbook = create :mealbook
      meal_with_assignment = create(
        :meal, mealbook: mealbook, meal_title: "Title 2"
      )
      meal_without_assignemt = create(
        :meal, mealbook: mealbook, meal_title: "Title 1"
      )

      MealAssignment.create! meal: meal_with_assignment, assigned_on: Date.today

      expect(
        MealbookPresenter.new(mealbook).available_meals
      ).to eq [meal_without_assignemt, meal_with_assignment]
    end
  end
end
