require 'rails_helper'

describe Forecast, :vcr do
  it "exists" do
    forecast = Forecast.new("denver,co")
    expect(forecast).to be_a(Forecast)
  end

  it "attributes" do
    forecast = Forecast.new("denver,co")
    expect(forecast.location).to eq("denver,co")
    expect(forecast.destination_coordinates).to be_a(Destination)
    expect(forecast.current).to be_a(Hash)
    expect(forecast.hourly).to be_a(Array)
    expect(forecast.daily).to be_a(Array)
    expect(forecast.fake_id).to eq(nil)
  end
end
