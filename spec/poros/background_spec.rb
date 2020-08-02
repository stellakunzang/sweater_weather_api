require 'rails_helper'

describe Background, :vcr do
  it "exists" do
    background = Background.new("denver,co")
    expect(background).to be_a(Background)
    expect(background.image_url).to be_a(Array)
  end
end
