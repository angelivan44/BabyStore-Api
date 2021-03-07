class ClothesController < ApplicationController
  skip_before_action :require_login
  before_action :current_clothe, only: %i[create, update, destroy, show]
  def index
    clothes = Clothe.all
    render json: clothes
  end
  def show
      render json: current_clothe, status: :ok
  end
  def create
    clothe = Clothe.new(clothe_params)
    category = Category.find(params[:category_id])
    clothe.category = category
    if clothe.save
      render json: clothe , status: :ok
    else
      render json: clothe.errors , status: :unprocessable_entity
    end
  end
  def update
    if current_clothe.update(clothe_params)
      render json: current_clothe , status: :ok
    else
      render json: current_clothe.errors , status: :unprocessable_entity
    end
  end
  def destroy
    current_clothe.delete
    render json: {message: "clothe was deleting"}
  end

  def current_clothe
    clothe = Clothe.find(params[:id])
  end
  private
  def clothe_params
    params.permit(:name , :price , :size , :brand , :stock , :images )
  end
end
