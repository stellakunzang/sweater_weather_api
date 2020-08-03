class Forecast
  include Coordinatable

  attr_reader :location,
              :current,
              :hourly,
              :daily,
              :fake_id

  def initialize(destination)
    @location = destination
    @latitude = coordinates.latitude
    @longitude = coordinates.longitude
    @current = forecast[:current]
    @hourly = forecast[:hourly]
    @daily = forecast[:daily]
    @fake_id = nil
  end

  def forecast
    WeatherService.new.get_forecast(@latitude, @longitude)
  end
end
