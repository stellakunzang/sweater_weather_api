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

  end
end
