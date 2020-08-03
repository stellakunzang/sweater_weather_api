class TrailSerializer
  include FastJsonapi::ObjectSerializer
  set_id :fake_id
  attributes :location, :forecast, :trails
end
