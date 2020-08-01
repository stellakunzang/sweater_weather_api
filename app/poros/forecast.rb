class Forecast
  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def forecast
    WeatherService.new.forecast(@latitude, @longitude)
  end
end
