require 'rails_helper'

describe LocationService, :vcr do
  it "gets location data" do
    json = LocationService.new.get_location("denver,co")
    expect(json).to be_a(Hash)
    expect(json[:results]).to be_a(Array)
    expect(json[:results][0][:providedLocation][:location]).to eq("denver,co")
    expect(json[:results][0][:locations][0][:latLng][:lat]).to eq(39.738453)
    expect(json[:results][0][:locations][0][:latLng][:lng]).to eq(-104.984853)
  end

  it "gets route data" do
    json = LocationService.new.road_trip("denver,co", "pueblo,co")
    expect(json).to be_a(Hash)
    expect(json[:route][:distance]).to be_a(Float)
    expect(json[:route][:legs]).to be_a(Array)
  end

end
