class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :fake_id
  attributes :location, :current, :hourly, :daily
end
