
FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "jown#{n}@forkem.com" }
    sequence(:username) { |n| "jown#{n}" }
    password "password123"
  end
end

