class UsersController < ApplicationController
  skip_before_action :require_login, only: :create
  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update
    if current_user.update(user_params)
      render json: current_user
    else
      render json: current_user.errors , status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.delete
      render json: {message: "the user was delete"}
    else
      render json: {message: "we can't delete this user"}
    end
  end
  def show
    render json: current_user
  end
  def user_params
    params.permit(:username, :password, :mail)
  end
end
