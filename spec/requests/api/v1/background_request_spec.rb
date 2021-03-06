require 'rails_helper'

describe 'Background API' do
  it 'returns appropriate background given location', :vcr do
    get '/api/v1/backgrounds?location=denver,co'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:id]).to eq(nil)
    expect(json[:data][:attributes][:image_url][0]).to be_a(String)
  end
end
