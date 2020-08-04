class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.new(user_params)
    if new_user.save
      render json: UsersSerializer.new(new_user)
    else
      render json: Error.new.authentication_error(params)
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
