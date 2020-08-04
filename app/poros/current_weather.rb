class CurrentWeather < Weather

  def initialize(location)
    @location = super
    @forecast = super
  end

  def current
    current_forecast = Hash.new { |hash, key| hash[key] = {overview: {}, details: {} } }
    current_forecast[:overview] = overview
    current_forecast[:details] = details
    current_forecast
  end

  def overview
    overview = Hash.new
    overview[:temperature] = @forecast[:current][:temp]
    overview[:description] = @forecast[:current][:weather][0][:description]
    overview[:date] = format_date(@forecast[:current][:dt])
    overview[:time] = format_time(@forecast[:current][:dt])
    overview[:high] = @forecast[:daily][0][:temp][:max]
    overview[:low] = @forecast[:daily][0][:temp][:min]
    overview
  end

  def details
    details = Hash.new
    details[:sunrise] = format_time(@forecast[:current][:sunrise])
    details[:sunset] = format_time(@forecast[:current][:sunset])
    details[:feels_like] = @forecast[:current][:feels_like]
    details[:humidity] = @forecast[:current][:humidity]
    details[:visibility] = @forecast[:current][:visibility]
    details[:uv_index] = @forecast[:current][:uvi]
    details
  end
end
