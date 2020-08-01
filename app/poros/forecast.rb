class Forecast

  attr_reader :location,
              :current,
              :hourly,
              :daily,
              :fake_id

  def initialize(destination, latitude, longitude)
    @location = destination
    @latitude = latitude
    @longitude = longitude
    @current = forecast[:current]
    @hourly = forecast[:hourly]
    @daily = forecast[:daily]
    @fake_id = nil
  end

  def forecast
    WeatherService.new.forecast(@latitude, @longitude)
  end
end
