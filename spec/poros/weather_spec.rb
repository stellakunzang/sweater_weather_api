require 'rails_helper'

describe Weather, :vcr do
  it "exists" do
    weather = Weather.new("denver,co")
    expect(weather).to be_a(Weather)
  end

  it "attributes" do
    weather = Weather.new("denver,co")
    expect(weather.location).to eq("denver,co")
    expect(weather.coordinates).to be_a(Destination)
    expect(weather.forecast).to be_a(Hash)
  end
end
