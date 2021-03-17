class UsersController < ApplicationController
  skip_before_action :require_login, only: :create
  def create
    user = User.new(user_params)
    if user.save
      render json: user.to_json(include: [{favorites: {methods: :service_url}},{wants: {methods: :service_url}}, {buys: {methods: :service_url}}])
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  def update

    favorite = Clothe.find(params[:favorit])

    if favorite
      match = current_user.favorites.find{|fa| fa.id == favorite.id.to_i}
      if match
        newFavorites = current_user.favorites.filter{|fa| fa.id != favorite.id.to_i}
        current_user.favorites = newFavorites
      else
        current_user.favorites.push(favorite)
      end
    end
    if !params[:favorit]
      if current_user.update(user_params)
        render json: current_user.to_json(include: [{favorites: {methods: :service_url}},{wants: {methods: :service_url}}, {buys: {methods: :service_url}}])
      else
        render json: current_user.errors , status: :unprocessable_entity
      end
    else
      render json: current_user.to_json(include: [{favorites: {methods: :service_url}},{wants: {methods: :service_url}}, {buys: {methods: :service_url}}])
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
    render json: current_user.to_json(include: [{favorites: {methods: :service_url}},{wants: {methods: :service_url}}, {buys: {methods: :service_url}}])
  end
  def user_params
    params.permit(:username, :password, :mail ,:favorit , :want , :buy)
  end
end
