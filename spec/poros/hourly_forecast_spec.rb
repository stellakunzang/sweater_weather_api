require 'rails_helper'

describe HourlyForecast, :vcr do
  it "exists" do
    hourly_forecast = HourlyForecast.new("denver,co")
    expect(hourly_forecast).to be_a(HourlyForecast)
  end

  it "attributes" do
    hourly_forecast = HourlyForecast.new("denver,co")
    expect(hourly_forecast.location).to eq("denver,co")
    expect(hourly_forecast.forecast).to be_a(Hash)
    expect(hourly_forecast.hourly).to be_a(Array)
  end

  it '#hourly' do
    hourly_forecast = HourlyForecast.new("denver,co")
    expect(hourly_forecast.hourly).to be_a(Array)
    expect(hourly_forecast.hourly.length).to eq(8)
    hourly_forecast.hourly.each do |hour|
      expect(hour).to be_a(Hash)
      expect(hour[:hour]).to be_a(String)
      expect(hour[:temperature]).to be_a(Float)
    end
  end
end
