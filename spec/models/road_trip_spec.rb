require 'rails_helper'

describe RoadTrip, type: :model do
  describe "validations" do
    it { should validate_presence_of :origin }
    it { should validate_presence_of :destination}
    it { should validate_presence_of :duration}
    it { should validate_presence_of :forecast}
  end

  describe "relationships" do
    it {should belong_to :user}
  end

  describe "instance methods" do
    it '#temperature' do

    end

    it '#description' do

    end
  end
end
