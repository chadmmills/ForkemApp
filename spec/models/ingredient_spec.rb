require 'rails_helper'

RSpec.describe Ingredient, type: :model do

  it { should belong_to :meal }

  it { should validate_presence_of :ingredient_name }

end
