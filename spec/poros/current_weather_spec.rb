require 'rails_helper'

describe CurrentWeather, :vcr do
  it "exists" do
    current_weather = CurrentWeather.new("denver,co")
    expect(current_weather).to be_a(CurrentWeather)
  end

  it "attributes" do
    current_weather = CurrentWeather.new("denver,co")
    expect(current_weather.location).to eq("denver,co")
    expect(current_weather.forecast).to be_a(Hash)
  end

  it '#current' do
    current_weather = CurrentWeather.new("denver,co")
    expect(current_weather.current).to be_a(Hash)
    expect(current_weather.current[:overview]).to be_a(Hash)
    expect(current_weather.current[:overview][:temperature]).to be_a(Float)
    expect(current_weather.current[:overview][:description]).to be_a(String)
    expect(current_weather.current[:overview][:date]).to be_a(String)
    expect(current_weather.current[:overview][:time]).to be_a(String)
    expect(current_weather.current[:overview][:high]).to be_a(Float)
    expect(current_weather.current[:overview][:low]).to be_a(Float)
    expect(current_weather.current[:details]).to be_a(Hash)
    expect(current_weather.current[:details][:sunrise]).to be_a(String)
    expect(current_weather.current[:details][:sunset]).to be_a(String)
    expect(current_weather.current[:details][:feels_like]).to be_a(Float)
    expect(current_weather.current[:details][:humidity]).to be_a(Integer)
    expect(current_weather.current[:details][:visibility]).to be_a(Integer)
    expect(current_weather.current[:details][:uv_index]).to be_a(Float)
  end
end
