class ProductsController < ApplicationController
  def index
     @product = Product.new
    @products = Product.all
  end

  def new
    @product = Product.new
  end
  
  def create
    @product= Product.new(product_params)
    if @product.save
      flash[:notice] = "Porduct was successfully created"
      redirect_to product_path(@product)
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end
  
  
  private
  def product_params
    params.permit(:name, :category)
  end
end
