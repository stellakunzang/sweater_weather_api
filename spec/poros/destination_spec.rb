require 'rails_helper'

describe Destination, :vcr do
  it "exists" do
    destination = Destination.new("denver,co")
    expect(destination.latitude).to eq(39.738453)
    expect(destination.longitude).to eq(-104.984853)
  end
end
