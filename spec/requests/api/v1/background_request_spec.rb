require 'rails_helper'

describe 'Background API' do
  it 'returns appropriate background given location' do
    get '/api/v1/backgrounds?location=denver,co'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data]).to be_a(Hash)
    expect(json[:data][:attributes][:url]).to be_a(String)
  end
end
