
FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "jown#{n}@forkem.com" }
    sequence(:username) { |n| "jown#{n}" }
    password "password123"
  end

  factory :mealbook do
    owner { create :user }
    mealbook_name "My Mealbook"
  end
end

