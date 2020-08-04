class HourlyForecast < Weather

  def initialize(location)
    @location = super
    @forecast = super
  end

  def hourly
    hourly_forecast = []
    forecast[:hourly].each do |hour|
      hour_forecast = {}
      hour_forecast[:hour] = find_hour(hour[:dt])
      hour_forecast[:temperature] = hour[:temp].to_f
      hourly_forecast << hour_forecast
    end
    hourly_forecast.shift
    hourly_forecast.pop(39)
    hourly_forecast
  end
end
