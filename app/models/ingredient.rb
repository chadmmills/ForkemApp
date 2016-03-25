class Ingredient < ActiveRecord::Base
  belongs_to :meal

  validates :ingredient_name, presence: true
end
