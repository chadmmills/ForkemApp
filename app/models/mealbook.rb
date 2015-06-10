class Mealbook < ActiveRecord::Base

  belongs_to :owner, class_name: User, foreign_key: "user_id"

  has_many :meals

  validates :mealbook_name, presence: true

end
