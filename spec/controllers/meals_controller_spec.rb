require 'rails_helper'

RSpec.describe MealsController, type: :controller do

  describe "#create" do
    it "should create any nested ingredients" do
      mealbook = create :mealbook
      meal_params = attributes_for(:meal).merge(
        ingredients_attributes: [
          { ingredient_name: "First Ingredient" }
        ]
      )

      expect do
        post :create, mealbook_id: mealbook.id, meal: meal_params
      end.to change(Ingredient, :count).by 1
    end
  end

end
