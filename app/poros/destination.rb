class Destination

  attr_reader :location

  def initialize(location)
    @location = location
  end

  def destination
    json ||= LocationService.new.get_location(@location)
    json[:results][0][:locations][0][:latLng]
  end

  def latitude
    destination[:lat]
  end

  def longitude
    destination[:lng]
  end
end
