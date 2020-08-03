class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.where(api_key: params[:api_key]).first
    if user
      roadtrip = user.road_trips.new(road_trip_params)
      if roadtrip.save
        render json: RoadTripSerializer.new(roadtrip)
      end
    end
  end

  private

  def road_trip_params
    params.permit(:origin, :destination)
  end
end
