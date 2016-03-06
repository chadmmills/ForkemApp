require 'rails_helper'

RSpec.describe MealAssignmentsController, type: :controller do

  describe "format.js" do
    describe "POST #create" do
      it "should create a meal assignment record" do
        meal = create :meal

        expect do
          post :create, meal_id: meal.id, weekday_id: Date.today
        end.to change(MealAssignment, :count).by 1
      end

      it "should update an existing meal assignment record" do
        meal = create :meal
        meal_assignment = create(:meal_assignment)

        post :create, meal_id: meal.id, weekday_id: Date.today
        meal_assignment.reload

        expect(meal_assignment.meal).to eq meal
      end
    end

    describe "DELETE destroy" do
      it "should remove the meal assignment" do
        meal_assignment = create(:meal_assignment)

        expect do
          delete :destroy, id: meal_assignment.id
        end.to change(MealAssignment, :count).by(-1)
      end
    end
  end

end
