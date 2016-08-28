class ProductsController < ApplicationController
  def index
     @products = Product.all
     @product = Product.new
    # if !params[:product].nil?
     #@product = Product.where(:name => params[:name].values)
     if Product.where(params[:name]).values == 1
       @correct_ans = @product
     else
       nil
   end
  # redirect_to product_path(@product)
  end

  def new
    @product = Product.new
  end
  
  def create
    @product= Product.new(product_params)
    if @product.save
      flash[:notice] = "Porduct was successfully created"
      redirect_to products_path
    else
      render 'new'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end
  
  def destroy
   @product = Product.find(params[:id])
   @product.destroy
   redirect_to products_path
  end
  
  
  
  private
  def product_params
    params.require(:product).permit("name[]", :category)
  end
  # def params_model
  #   params[:product]
  # end
end
