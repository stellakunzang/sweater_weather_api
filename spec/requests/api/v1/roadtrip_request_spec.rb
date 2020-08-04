require 'rails_helper'

describe 'Roadtrip API' do
  it 'returns roadtrip information', :vcr do
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'

    json = JSON.parse(response.body, symbolize_names: true)
    api_key = json[:data][:attributes][:api_key]

    post "/api/v1/road_trip?origin=denver,co&destination=pueblo,co&api_key=#{api_key}"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:id]).to_not eq(nil)
    expect(json[:data][:type]).to eq("road_trip")
    expect(json[:data][:attributes][:origin]).to eq("denver,co")
    expect(json[:data][:attributes][:destination]).to eq("pueblo,co")
    expect(json[:data][:attributes][:duration]).to eq("6237")
    expect(json[:data][:attributes][:temperature]).to be_a(Float)
    expect(json[:data][:attributes][:description]).to be_a(String)
  end

  it 'returns error without authorized user', :vcr do
    post "/api/v1/road_trip?origin=denver,co&destination=pueblo,co&api_key=#api_key"

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:status]).to eq("error")
    expect(json[:code]).to eq(401)
    expect(json[:message]).to eq("Unauthorized")
  end
end
