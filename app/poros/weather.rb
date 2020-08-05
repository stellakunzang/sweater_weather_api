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

  def format_date(seconds)
    Time.at(seconds).strftime("%B %-d")
  end

  def format_time(seconds)
    Time.at(seconds).strftime("%l:%M %p")
  end

  def day_of_the_week(seconds)
    Time.at(seconds).strftime("%A")
  end

  def find_hour(seconds)
    Time.at(seconds).strftime("%I %p")
  end
end
