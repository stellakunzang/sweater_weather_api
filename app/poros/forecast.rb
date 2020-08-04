class Forecast
  attr_reader :location,
              :current,
              :hourly,
              :daily,
              :fake_id

  def initialize(destination)
    @fake_id = nil
    @location = destination
    @current = CurrentWeather.new(destination).current
    @hourly = HourlyForecast.new(destination).hourly
    @daily = DailyForecast.new(destination).daily
  end
end
