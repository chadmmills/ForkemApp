class MealsController < ApplicationController

  def index
  end

  def new
  end

  def create
    if new_meal.save
      redirect_to mealbook, notice: "Meal was saved"
    else
      render :new
    end
  end

  private

    def new_meal
      @meal ||= Meal.new(meal_params)
    end

    def meal_params
      params.require(:meal).permit(
        :meal_title,
        :meal_notes,
      ).merge(mealbook: mealbook)
    end

    def mealbook
      @mealbook ||= Mealbook.find(params[:mealbook_id])
    end
    helper_method :mealbook

end
