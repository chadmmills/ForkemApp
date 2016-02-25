require 'rails_helper'

RSpec.describe MealAssignment, type: :model do

  it { should belong_to :meal }

  it { should validate_presence_of :assigned_on }
  it { should validate_presence_of :meal }

end
