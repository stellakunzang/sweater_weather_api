class Api::V1::ForecastController < ApplicationController
  def index
    destination = Destination.new(params[:location])
    forecast = Forecast.new(destination.latitude, destination.longitude).forecast
    
  end
end
