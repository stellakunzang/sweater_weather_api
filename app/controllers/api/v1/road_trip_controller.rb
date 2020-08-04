class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      roadtrip = user.road_trips.create(road_trip_params)
      render json: RoadTripSerializer.new(roadtrip)
    else
      render json: Error.new.unauthorized
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination)
  end
end
