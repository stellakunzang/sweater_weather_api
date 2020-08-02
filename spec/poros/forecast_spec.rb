require 'rails_helper'

describe Forecast, :vcr do
  it "exists" do
    forecast = Forecast.new("denver,co", 39.738453, -104.984853)
    expect(forecast).to be_a(Forecast)
  end

  it "attributes" do
    forecast = Forecast.new("denver,co", 39.738453, -104.984853)
    expect(forecast.location).to eq("denver,co")
    expect(forecast.current).to be_a(Hash)
    expect(forecast.hourly).to be_a(Array)
    expect(forecast.daily).to be_a(Array)
    expect(forecast.fake_id).to eq(nil)
  end
end
