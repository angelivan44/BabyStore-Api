class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :require_login

  def require_login
    authenticate_token || render_unauthorized("Accses denied")
  end
  def current_user
    @current_user ||= authenticate_token
  end
  def render_unauthorized(message)
    errors = {errors: [message]}
    render json: errors
  end

  def authenticate_token
    authenticate_with_http_token do |token, _options|
      User.find_by(token: token)
    end
  end
end
