class Mealbook < ActiveRecord::Base

  belongs_to :owner, class_name: User, foreign_key: "user_id"

  has_many :meals
  has_many :meal_assignments, through: :meals

  validates :mealbook_name, presence: true

end
