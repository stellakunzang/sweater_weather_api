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
    self.forecast = WeatherService.new.trip_forecast(duration, d.latitude, d.longitude)
  end
end
