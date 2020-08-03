class Trail
  attr_reader :location,
              :forecast,
              :trails,
              :fake_id

  def initialize(location, latitude, longitude)
    @location = location
    @latitude = latitude
    @longitude = longitude
    @forecast =  forecast
    @trails = nearby_trails
    @fake_id = nil
  end

  def forecast
    current = WeatherService.new.get_forecast(@latitude, @longitude)
    { summary: current[:current][:weather][0][:description], temperature: current[:current][:temp] }
  end

  def nearby_trails
    trails = []
    trail_data = TrailService.new.get_trails(@latitude, @longitude)
    trail_data[:trails].each do |trail|
      trail = Hash.new { |hash, key| hash[key] = {name: nil, summary: nil, difficulty: nil, location: nil, distance_to_trail: nil} }
      trail[:name] = [:name]
      trail[:summary] = [:summary]
      trail[:difficulty] = [:difficulty]
      trail[:location] = [:location]
      trail[:distance_to_trail] = LocationService.new.distance_to_trail(@latitude, @longitude, [:latitude], [:longitude])
      trails << trail
    end
    trails
  end
end
