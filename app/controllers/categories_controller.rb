class CategoriesController < ApplicationController
  skip_before_action :require_login
  before_action :current_category, only: %i[create, update, destroy, show]
  def create
    category = Category.new(category_params)
    if category.save
      render json: category , status: :ok
    else
      render category.errors, status: :unprocessable_entity
    end
  end

  def update
    if current_category.update(category_params)
      render json: current_category , status: :ok
    else
      render json: current_category.errors ,status: :unprocessable_entity
    end
  end

  def destroy
    if current_category.delete
      render json: {message: "category was deleting"}
    else
      render json: {message: "we cant delete category"}
    end
  end

  def show
    render json: current_category
  end

  def index
    categories = Category.all
    render json: categories
  end

  def current_category
    category = Category.find(params[:id])
  end
  private
  def category_params
    params.permit(:name, :color , :cover)
  end

end
