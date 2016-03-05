require 'rails_helper'

RSpec.describe "mealbooks/show" do
  it "should render a meal for an assigned day" do
    mealbook = create :mealbook
    tuesday_meal = create :meal, mealbook: mealbook
    tuesday_assignment = create :meal_assignment, meal: tuesday_meal, assigned_on: Date.today.monday + 1

    render template: "mealbooks/show", locals: { mealbook: MealbookPresenter.new(mealbook) }

    expect(rendered).to have_css "#tuesday .meal"
  end
end
