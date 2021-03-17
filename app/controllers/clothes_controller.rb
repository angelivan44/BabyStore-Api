class ClothesController < ApplicationController
  skip_before_action :require_login, only: %i[index , show ]
  before_action :current_clothe, only: %i[create, update, destroy, show]
  include Pundit
  def index
    clothes = Clothe.all
    render json: clothes.map{|clothe| clothe.as_json(methods: :service_url , include: :images) }
  end

  def show
    render json: current_clothe.as_json(methods: :service_url , include: :images), status: :ok
  end

  def create
    clothe = Clothe.new(clothe_params)
    category = Category.find(params[:category_id])
    clothe.category = category
    authorize clothe
    if clothe.save
      render json: clothe.as_json(methods: :service_url, include: :images) , status: :ok
    else
      render json: clothe.errors , status: :unprocessable_entity
    end
  end

  def update
    authorize current_clothe
    if current_clothe.update(clothe_params)
      render json: current_clothe.as_json(methods: :service_url, include: :images), status: :ok
    else
      render json: current_clothe.errors , status: :unprocessable_entity
    end
  end

  def destroy
    authorize current_clothe
    if current_clothe.delete
      render json: {message: "ok"}
    else 
      render json: {message: "we can't delete this clothe"}
    end
  end

  def current_clothe
    clothe = Clothe.find(params[:id])
  end

  private

  def clothe_params
    params.require(:clothe).permit(:name , :price, :oldprice , :size , :brand , :status, :position , :images )
  end

end
