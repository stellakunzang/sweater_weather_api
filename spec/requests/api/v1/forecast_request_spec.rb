require 'rails_helper'

describe 'Forecast API' do
  it 'returns forecast when given a city and state' do
    get '/api/v1/forecast?location=denver,co'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:current]).to be_a(Hash)
    expect(json[:current][:weather]).to be_a(Array)
    expect(json[:daily]).to be_a(Array)
    expect(json[:daily].length).to eq(7)
  end
end
