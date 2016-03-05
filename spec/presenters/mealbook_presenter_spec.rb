require 'rails_helper'

RSpec.describe MealbookPresenter do
  describe "#week_days" do
    it "should return a Weekday with meal if assigned" do
      mealbook = create :mealbook
      monday_meal = create :meal, mealbook: mealbook
      create :meal_assignment, meal: monday_meal, assigned_on: Date.today.monday
      tuesday_meal = create :meal, mealbook: mealbook
      create :meal_assignment, meal: tuesday_meal, assigned_on: Date.today.monday + 1

      expect(
        MealbookPresenter.new(mealbook).week_days.second.meal
      ).to eq tuesday_meal
    end
  end

  describe '#meals_with_no_assignment_for_current_week' do
    it "should only return meals week no current week assignments" do
      mealbook = create :mealbook
      meal_with_assignment = create :meal, mealbook: mealbook
      meal_without_assignemt = create :meal, mealbook: mealbook

      MealAssignment.create! meal: meal_with_assignment, assigned_on: Date.today

      expect(
        MealbookPresenter.new(mealbook).meals_with_no_assignment_for_current_week
      ).to include meal_without_assignemt
    end
    
    it "should not return meals week current week assignments" do
      mealbook = create :mealbook
      meal_with_assignment = create :meal, mealbook: mealbook
      meal_without_assignemt = create :meal, mealbook: mealbook

      MealAssignment.create! meal: meal_with_assignment, assigned_on: Date.today

      expect(
        MealbookPresenter.new(mealbook).meals_with_no_assignment_for_current_week
      ).to_not include meal_with_assignment
    end
  end
end
