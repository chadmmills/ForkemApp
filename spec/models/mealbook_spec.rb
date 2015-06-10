require 'rails_helper'

RSpec.describe Mealbook, type: :model do

  it { should belong_to :owner }
  it { should have_many :meals }
  it { should validate_presence_of :mealbook_name }
  it { should respond_to :public }

end
