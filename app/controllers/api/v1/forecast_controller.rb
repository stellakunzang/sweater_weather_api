class Api::V1::ForecastController < ApplicationController
  def index
    d = Destination.new(params[:location])
    forecast = Forecast.new(d.location, d.latitude, d.longitude)
    render json: ForecastSerializer.new(forecast)
  end
end
