class MealsController < ApplicationController

  def index
  end

  def new
    render locals: { meal: Meal.new }
  end

  def create
    if new_meal.save
      redirect_to mealbook, notice: "Meal was saved"
    else
      render :new, locals: { meal: new_meal }
    end
  end

  private

    def new_meal
      @_meal ||= Meal.new(meal_params)
    end

    def meal_params
      params.require(:meal).permit(
        :meal_title,
        :meal_notes,
        ingredients_attributes: [
          :id,
          :ingredient_name,
          :_destroy,
        ]
      ).merge(mealbook: mealbook)
    end

    def mealbook
      @_mealbook ||= Mealbook.find(params[:mealbook_id])
    end
    helper_method :mealbook

end
