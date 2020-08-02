require 'rails_helper'

describe 'Login API' do
  it 'can login a registered user', :vcr do
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'

    post '/api/v1/sessions?email=whatever@example.com&password=password'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:status]).to eq(200)
    expect(json[:body][:data][:type]).to eq("users")
    expect(json[:data][:id]).to_not eq(nil)
    expect(json[:data][:attributes][:email]).to eq("whatever@example.com")
    expect(json[:data][:attributes][:api_key]).to_not eq(nil)
  end
end
