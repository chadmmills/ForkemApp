
FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "jown#{n}" }
    email { "#{username}@forkem.io" }
    password "password123"
  end

  factory :mealbook do
    owner { create :user }
    mealbook_name "My Mealbook"
  end

  factory :meal do
    meal_title "Chicken Something-or-nother"
    mealbook
  end

  factory :meal_assignment do
    meal
    assigned_on Date.today
  end
end

