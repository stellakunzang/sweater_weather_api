require './lib/assets/coordinatable'
require 'date'

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
    @current = current
    @hourly = forecast[:hourly]
    @daily = forecast[:daily]
    @fake_id = nil
  end

  def forecast
    forecast ||= WeatherService.new.get_forecast(@latitude, @longitude)
  end

  def current
    current_forecast = Hash.new { |hash, key| hash[key] = {overview: {}, details: {} } }
    current_forecast[:overview] = overview
    current_forecast[:details] = details
    current_forecast
  end

  def overview
    overview = Hash.new
    overview[:temperature] = forecast[:current][:temp]
    overview[:description] = forecast[:current][:weather][0][:description]
    overview[:date] = format_date(forecast[:current][:dt])
    overview[:time] = format_time(forecast[:current][:dt])
    overview[:high] = forecast[:daily][0][:temp][:max]
    overview[:low] = forecast[:daily][0][:temp][:min]
    overview
  end

  def details
    details = Hash.new
    details[:sunrise] = format_time(forecast[:current][:sunrise])
    details[:sunset] = format_time(forecast[:current][:sunset])
    details[:feels_like] = forecast[:current][:feels_like]
    details[:humidity] = forecast[:current][:humidity]
    details[:visibility] = forecast[:current][:visibility]
    details[:uv_index] = forecast[:current][:uvi]
    details
  end

  def format_date(unix_utc)
    date_time = offset(unix_utc)
    Time.at(date_time).strftime("%B %-d")
  end

  def format_time(unix_utc)
    date_time = offset(unix_utc)
    Time.at(date_time).strftime("%I:%M %p")
  end

  def offset(unix_utc)
    unix_utc - forecast[:timezone_offset]
  end

end
