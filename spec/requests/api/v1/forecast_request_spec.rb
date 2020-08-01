require 'rails_helper'

describe 'Forecast API' do
  it 'returns detailed forecast information when given a city and state' do
    get '/api/v1/forecast?location=denver,co'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:attributes][:current][:weather]).to be_a(Array)
    expect(json[:data][:attributes][:hourly]).to be_a(Array)
    expect(json[:data][:attributes][:daily]).to be_a(Array)
    expect(json[:data][:attributes][:daily].length).to eq(8)
  end
end
