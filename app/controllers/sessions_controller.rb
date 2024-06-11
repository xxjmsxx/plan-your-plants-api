class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:create, :destroy]

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = encode_token({ user_id: user.id })
      cookies.signed[:jwt] = {
        value: token,
        httponly: true,
        secure: Rails.env.production?,
        same_site: :strict,
        expires: 1.hour.from_now
      }
      cookies[:auth_status] = { value: 'authenticated', path: '/', secure: Rails.env.production?, same_site: :strict }
      render json: { user: user }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    cookies.delete(:jwt)
    cookies.delete(:auth_status)
    head :no_content
  end

  private

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
