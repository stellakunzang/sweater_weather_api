require './lib/assets/coordinatable'
require 'date'

class Weather
  include Coordinatable

  attr_reader :location

  def initialize(location)
    @location = location
    @latitude = coordinates.latitude
    @longitude = coordinates.longitude
    @forecast ||= forecast
  end

  def forecast
    WeatherService.new.get_forecast(@latitude, @longitude)
  end

  def format_date(unix_utc)
    Time.at(unix_utc).strftime("%B %-d")
  end

  def format_time(unix_utc)
    Time.at(unix_utc).strftime("%l:%M %p")
  end

  def day_of_the_week(unix_utc)
    Time.at(unix_utc).strftime("%A")
  end

  def find_hour(unix_utc)
    Time.at(unix_utc).strftime("%I %p")
  end
end
