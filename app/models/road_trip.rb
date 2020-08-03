class RoadTrip < ApplicationRecord
  before_create :calculate_duration
  belongs_to :user
  validates_presence_of :origin
  validates_presence_of :destination

  def calculate_duration
    road_trip = LocationService.new.road_trip(self.origin, self.destination)
    self.duration = road_trip[:route][:time]
    calculate_forecast(self.duration)
  end

  def calculate_forecast(duration)
    d = Destination.new(self.destination)
    forecast = WeatherService.new.get_forecast(d.latitude, d.longitude)
    temp_description(forecast, duration)
  end

  def temp_description(forecast, duration)
    hour = (Time.now + duration.to_i).beginning_of_hour.to_i
    dt = find_dt(forecast, hour)
    self.temperature = dt[:temp]
    self.description = dt[:weather][0][:description]
  end

  def find_dt(json, hour)
    json[:hourly].find do |hour_hash|
      hour_hash.find do |key, value|
        key == :dt && value == hour
      end
    end
  end

end
