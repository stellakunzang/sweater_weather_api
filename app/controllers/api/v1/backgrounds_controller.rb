class Api::V1::BackgroundsController < ApplicationController
  def index
    d = Destination.new(params[:location])
    background = Background.new(d.location)
    render json: BackgroundSerializer.new(background)
  end
end
