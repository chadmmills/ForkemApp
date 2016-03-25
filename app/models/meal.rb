class Meal < ActiveRecord::Base

  scope :by_title, -> { order(:meal_title) }

  belongs_to :mealbook

  has_many :meal_assignments
  has_many :ingredients

  accepts_nested_attributes_for(
    :ingredients,
    reject_if: :all_blank,
    allow_destroy: true
  )

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
