class Api::V1::BackgroundsController < ApplicationController
  def index
    d = Destination.new(params[:location])
    background = Background.new.destination_image(d.location)
    render json: BackgroundSerializer.new(background)
  end
end
