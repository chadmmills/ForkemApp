require "rails_helper"

RSpec.describe "mealbooks/show" do
  it "should render a meal for an assigned day" do
    mealbook = create :mealbook
    tuesday_meal = create :meal, mealbook: mealbook
    create(
      :meal_assignment,
      meal: tuesday_meal,
      assigned_on: Date.today.monday + 1
    )

    render(
      template: "mealbooks/show",
      locals: { mealbook: MealbookPresenter.new(mealbook) }
    )

    expect(rendered).to have_css "#tuesday .meal"
  end

  it "should show the remove icon within a weekday but not unassigned list" do
    mealbook = create :mealbook
    unassigned_meal = create :meal, mealbook: mealbook
    tuesday_meal = create :meal, mealbook: mealbook
    create(
      :meal_assignment,
      meal: tuesday_meal,
      assigned_on: Date.today.monday + 1
    )

    render(
      template: "mealbooks/show",
      locals: { mealbook: MealbookPresenter.new(mealbook) }
    )

    expect(rendered).to have_css "#tuesday .meal .meal-unassign"
  end
end
