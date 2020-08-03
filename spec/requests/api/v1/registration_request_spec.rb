require 'rails_helper'

describe 'Registration API' do
  it 'can register a new user', :vcr do
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:data][:type]).to eq("users")
    expect(json[:data][:id]).to_not eq(nil)
    expect(json[:data][:attributes][:email]).to eq("whatever@example.com")
    expect(json[:data][:attributes][:api_key]).to_not eq(nil)
  end

  it "cannot register new user if passwords don't match" do
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password1'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:status]).to eq("error")
    expect(json[:code]).to eq(400)
    expect(json[:message]).to eq("password and password confirmation must match.")
  end

  it "cannot register new user if field left blank" do
    post '/api/v1/users?email=whatever@example.com&password=password'

    json = JSON.parse(response.body, symbolize_names: true)
    
    expect(json[:status]).to eq("error")
    expect(json[:code]).to eq(400)
    expect(json[:message]).to eq("email, password, and password confirmation must be present.")
  end

  it "cannot register new user if email already exists" do
    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'

    post '/api/v1/users?email=whatever@example.com&password=password&password_confirmation=password'

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:status]).to eq("error")
    expect(json[:code]).to eq(400)
    expect(json[:message]).to eq("an account already exists for that email.")
  end
end
