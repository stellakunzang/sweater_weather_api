class DailyForecast < Weather

  def initialize(location)
    @location = super
    @forecast = super
  end

  def daily
    weekly_forecast = []
    forecast[:daily].each do |day|
      daily_forecast = {}
      daily_forecast[:day_of_week] = day_of_the_week(day[:dt])
      daily_forecast[:description] = day[:weather][0][:main]
      daily_forecast[:percipitation] = day[:rain].to_f
      daily_forecast[:high] = day[:temp][:max].to_f
      daily_forecast[:low] = day[:temp][:min].to_f
      weekly_forecast << daily_forecast
    end
    weekly_forecast.pop(2)
    weekly_forecast.shift
    weekly_forecast
  end
end
