class MealAssignmentsController < ApplicationController

  def create
    meal_assignment.meal = meal
    meal_assignment.save!
    head :ok
  end

  private

    def meal
      @_meal ||= Meal.find params[:meal_id]
    end

    def meal_assignment
      @_meal_assignment ||= MealAssignment.find_or_initialize_by(assigned_on: params[:weekday_id])
    end

end
