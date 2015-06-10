class Meal < ActiveRecord::Base

  belongs_to :mealbook

  enum weekday: [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]
  enum meal_type: [:breakfast, :lunch, :dinner]

  validates :meal_title, presence: true

end
