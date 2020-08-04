class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: { status: 200, body: UsersSerializer.new(user) }
    else
      render json: Error.new.bad_credentials
    end
  end
end
