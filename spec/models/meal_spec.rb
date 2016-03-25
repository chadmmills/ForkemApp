require 'rails_helper'

RSpec.describe Meal, type: :model do

  it { should belong_to(:mealbook) }
  it { should have_many :ingredients }

  it { should define_enum_for(:weekday) }
  it { should define_enum_for(:meal_type) }


end
