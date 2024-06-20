# app/controllers/users_controller.rb
# frozen_string_literal: true
module Api
  class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
      user = User.new(user_params)
      if user.save
        render json: user, status: :created
      else
        render json: user.errors, status: :unprocessable_content
      end
    end

    def current_user_info
      user = current_user
      render json: {"id": user.id,
      "username": user.username,
      "email": user.email,
    }
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :username)
    end
  end
end
