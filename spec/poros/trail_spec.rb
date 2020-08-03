require 'rails_helper'

describe Trail, :vcr do
  it "exists" do
    trail = Trail.new("denver,co")
    expect(trail).to be_a(Trail)
  end

  it "attributes" do
    trail = Trail.new("denver,co")
    expect(trail.location).to eq("denver,co")
    expect(trail.destination_coordinates).to be_a(Destination)
    expect(trail.fake_id).to eq(nil)

    expect(trail.forecast).to be_a(Hash)
    expect(trail.forecast[:summary]).to be_a(String)
    expect(trail.forecast[:temperature]).to be_a(Float)

    expect(trail.trails).to be_a(Array)
    trail.trails.each do |trail|
      expect(trail[:name]).to_not eq(nil)
      expect(trail[:name]).to be_a(String)

      expect(trail[:summary]).to_not eq(nil)
      expect(trail[:summary]).to be_a(String)

      expect(trail[:difficulty]).to_not eq(nil)
      expect(trail[:difficulty]).to be_a(String)

      expect(trail[:location]).to_not eq(nil)
      expect(trail[:location]).to be_a(String)

      expect(trail[:distance_to_trail]).to_not eq(nil)
      expect(trail[:distance_to_trail]).to be_a(Float)
    end
  end

end
