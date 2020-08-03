require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password}
    it { should validate_presence_of :password_confirmation}
  end

  describe "relationships" do
    it {should have_many :road_trips}
  end

  describe "instance methods" do
    it '#set_api_key' do

    end
  end
end
