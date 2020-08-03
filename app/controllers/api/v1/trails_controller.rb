class Api::V1::TrailsController < ApplicationController
  def index
    trail = Trail.new(params[:location])
    render json: TrailSerializer.new(trail)
  end
end
