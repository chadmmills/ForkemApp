require 'rails_helper'

RSpec.describe User do

  it { should validate_presence_of :email } 
  it { should validate_presence_of :username } 

  it { should have_many :mealbooks }

end
