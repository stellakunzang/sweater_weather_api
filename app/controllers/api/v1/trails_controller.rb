class Api::V1::TrailsController < ApplicationController
  def index
    d = Destination.new(params[:location])
    trail = Trail.new(d.location, d.latitude, d.longitude)
    render json: TrailSerializer.new(trail)
  end
end
