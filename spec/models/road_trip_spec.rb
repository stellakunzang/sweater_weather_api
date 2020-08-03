require 'rails_helper'

describe RoadTrip, type: :model do
  describe "validations" do
    it { should validate_presence_of :origin }
    it { should validate_presence_of :destination}
  end

  describe "relationships" do
    it {should belong_to :user}
  end

  describe "instance methods" do
    it '#calculate_duration' do

    end

    it '#calculate_forecast' do

    end

    it '#temp_description' do

    end

    it '#find_dt' do

    end
  end
end
