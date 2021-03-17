class SessionsController < ApplicationController
  skip_before_action :require_login, only: :create
  def create
    user = User.valid_login?(params[:mail], params[:password])
    if user 
      user.regenerate_token
      render json: user.to_json(include: [{favorites: {methods: :service_url}},{wants: {methods: :service_url}}, {buys: {methods: :service_url}}])
    else
      render json: {message: "errors"}
    end

  end

  def destroy
    current_user.invalidate_token
    render json: {message: "ok"}
  end
end
