require 'rails_helper'

describe WeatherService, :vcr do
  it "gets trail data" do
    json = WeatherService.new.get_forecast(39.738453, -104.984853)
    expect(json).to be_a(Hash)
    expect(json[:lat]).to eq(39.74)
    expect(json[:lon]).to eq(-104.98)
    expect(json[:current]).to be_a(Hash)
    expect(json[:current][:weather]).to be_a(Array)
    expect(json[:hourly]).to be_a(Array)
    expect(json[:hourly][0][:dt]).to_not eq(nil)
    expect(json[:hourly][0][:weather]).to be_a(Array)
    expect(json[:hourly][0][:weather][0][:id]).to_not eq(nil)
    expect(json[:daily]).to be_a(Array)
    expect(json[:daily][0][:dt]).to_not eq(nil)
    expect(json[:daily][0][:temp]).to be_a(Hash)
    expect(json[:hourly][0][:weather][0][:id]).to_not eq(nil)
  end

end
