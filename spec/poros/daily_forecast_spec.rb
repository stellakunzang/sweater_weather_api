require 'rails_helper'

describe DailyForecast, :vcr do
  it "exists" do
    daily_forecast = DailyForecast.new("denver,co")
    expect(daily_forecast).to be_a(DailyForecast)
  end

  it "attributes" do
    daily_forecast = DailyForecast.new("denver,co")
    expect(daily_forecast.location).to eq("denver,co")
    expect(daily_forecast.forecast).to be_a(Hash)
    expect(daily_forecast.daily).to be_a(Array)
  end

  it '#daily' do
    daily_forecast = DailyForecast.new("denver,co")
    expect(daily_forecast.daily).to be_a(Array)
    expect(daily_forecast.daily.length).to eq(5)
    daily_forecast.daily.each do |day|
      expect(day).to be_a(Hash)
      expect(day[:day_of_week]).to be_a(String)
      expect(day[:description]).to be_a(String)
      expect(day[:percipitation]).to be_a(Float)
      expect(day[:high]).to be_a(Float)
      expect(day[:low]).to be_a(Float)
    end 
  end
end
