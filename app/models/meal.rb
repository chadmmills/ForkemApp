class Meal < ActiveRecord::Base

  belongs_to :mealbook

  enum weekday: [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]
  enum meal_type: [:breakfast, :lunch, :dinner, :snack]

  validates :meal_title, presence: true

  def self.weekdays_array
    self.weekdays.keys.map { |weekday| [weekday.capitalize, weekday] }
  end

  def self.meal_types_array
    self.meal_types.keys.map { |mt| [mt.capitalize, mt] }
  end

end
