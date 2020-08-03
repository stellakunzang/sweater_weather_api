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
    forecast = Hash.new
    current = WeatherService.new.get_forecast(@latitude, @longitude)
    forecast[:summary] = current[:current][:weather][0][:description]
    forecast[:temperature] = current[:current][:temp]
    forecast 
  end

  def nearby_trails
    trails = []
    trail_data = TrailService.new.get_trails(@latitude, @longitude)
    trail_data[:trails].each do |trail|
      trail_hash = Hash.new
      trail_hash[:name] = trail[:name]
      trail_hash[:summary] = trail[:summary]
      trail_hash[:difficulty] = trail[:difficulty]
      trail_hash[:location] = trail[:location]
      trail_hash[:distance_to_trail] = new_trip(trail[:location])
      trails << trail_hash
    end
    trails
  end

  def new_trip(destination)
    route = LocationService.new.road_trip(@location, destination)
    route[:route][:distance]
  end
end
