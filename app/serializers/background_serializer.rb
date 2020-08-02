class BackgroundSerializer
  include FastJsonapi::ObjectSerializer
  set_id :fake_id
  attribute :image_url
end
