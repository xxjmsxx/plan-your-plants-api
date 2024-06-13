class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection

  before_action :authorized
  before_action :set_csrf_token

  def encode_token(payload)
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  def decoded_token
    if cookies.signed[:jwt]
      token = cookies.signed[:jwt]
      begin
        code = JWT.decode(token, Rails.application.secret_key_base, true, algorithm: 'HS256')
        code
      rescue JWT::DecodeError => e
        Rails.logger.error("JWT decoding error: #{e.message}")
        nil
      end
    end
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  private

  def set_csrf_token
    cookies['CSRF-TOKEN'] = {
      value: form_authenticity_token,
      secure: Rails.env.production?,
      same_site: :strict
    }
  end
end
