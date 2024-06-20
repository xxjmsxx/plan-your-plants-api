  module Api
  class SessionsController < ApplicationController
    skip_before_action :authorized, only: [:create, :destroy, :is_logged_in?]

    def create
      user = User.find_by(email: params[:email])

      if user&.authenticate(params[:password])
        token = encode_token({ user_id: user.id })
        cookies.signed[:jwt] = {
          value: token,
          httponly: true,
          secure: true,
          same_site: :strict,
          expires: 1.hour.from_now
          }
        render json: { user: user, cookies: cookies}, status: :ok
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end

    def destroy
      cookies.delete(:jwt)
      head :no_content
    end

    def is_logged_in?
      render json: { logged_in: logged_in? }
    end

    private

    def encode_token(payload)
      JWT.encode(payload, Rails.application.secret_key_base)
    end
  end
end
