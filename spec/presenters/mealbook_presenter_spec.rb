require 'rails_helper'

RSpec.describe MealbookPresenter do
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
