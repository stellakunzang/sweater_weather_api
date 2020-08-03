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
    expect(json[:data][:attributes][:origin]).to be_a(Array)
    expect(json[:data][:attributes][:destination]).to be_a(Array)
    expect(json[:data][:attributes][:duration]).to be_a(Array)
    expect(json[:data][:attributes][:forecast].length).to eq(2)
    expect(json[:data][:attributes][:forecast][:temperature]).to be_a(Array)
    expect(json[:data][:attributes][:forecast][:description]).to be_a(Array)
  end
end
