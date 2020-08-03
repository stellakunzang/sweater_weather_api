require 'rails_helper'

describe TrailService, :vcr do
  it "gets trail data" do
    json = TrailService.new.get_trails(39.738453, -104.984853)
    expect(json).to be_a(Hash)
    expect(json[:trails]).to be_a(Array)
    expect(json[:trails][0][:id]).to_not eq(nil)
    expect(json[:trails][0][:name]).to_not eq(nil)
    expect(json[:trails][0][:type]).to_not eq(nil)
    expect(json[:trails][0][:summary]).to_not eq(nil)
    expect(json[:trails][0][:difficulty]).to_not eq(nil)
    expect(json[:trails][0][:location]).to_not eq(nil)
  end

end
