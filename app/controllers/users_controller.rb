# app/controllers/users_controller.rb
# frozen_string_literal: true
class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create, :login]
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user&.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username)
  end

  def encode_token(payload)
    JWT.encode(payload, 'your_secret_key')
  end
end
