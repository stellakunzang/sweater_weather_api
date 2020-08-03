require 'rails_helper'

describe 'Trails API' do
  it 'returns nearby trail information', :vcr do
    get '/api/v1/trails?location=denver,co'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:id]).to eq(nil)
    expect(json[:data][:type]).to eq("trail")
    expect(json[:data][:attributes][:location]).to eq("denver,co")
    expect(json[:data][:attributes][:forecast]).to be_a(Hash)
    expect(json[:data][:attributes][:trails]).to be_a(Array)
    expect(json[:data][:attributes][:trails][0][:name]).to be_a(String)
    expect(json[:data][:attributes][:trails][0][:name]).to_not eq(nil)
    expect(json[:data][:attributes][:trails][0][:summary]).to be_a(String)
    expect(json[:data][:attributes][:trails][0][:summary]).to_not eq(nil)
    expect(json[:data][:attributes][:trails][0][:difficulty]).to be_a(String)
    expect(json[:data][:attributes][:trails][0][:difficulty]).to_not eq(nil)
    expect(json[:data][:attributes][:trails][0][:location]).to be_a(String)
    expect(json[:data][:attributes][:trails][0][:location]).to_not eq(nil)
    expect(json[:data][:attributes][:trails][0][:distance_to_trail]).to be_a(Float)
    expect(json[:data][:attributes][:trails][0][:distance_to_trail]).to_not eq(nil)
  end
end
