class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.new(user_params)
    if new_user.save
      render json: UsersSerializer.new(new_user)
    else
      error_message = find_error(user_params)
      render json: {status: "error", code: 400, message: "#{error_message}"}
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def find_error(params)
    if params[:email].nil? || params[:password].nil? || params[:password_confirmation].nil?
      "email, password, and password confirmation must be present."
    elsif User.where(email: params[:email]).exists?
      "an account already exists for that email."
    elsif params[:password] != params[:password_confirmation]
      "password and password confirmation must match."
    end
  end
end
