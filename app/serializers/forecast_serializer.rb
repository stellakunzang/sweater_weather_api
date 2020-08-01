class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id :fake_id
  attributes :current, :hourly, :daily
end
