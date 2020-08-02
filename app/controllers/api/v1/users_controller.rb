class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.new(user_params)
    if new_user.save
      UserSerializer(new_user)
    else
      #400 error with description of why the request failed
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
