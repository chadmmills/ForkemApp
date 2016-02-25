class MealAssignment < ActiveRecord::Base

  belongs_to :meal, required: true

  validates :assigned_on, presence: true

end
