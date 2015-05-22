class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(product_id)
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(product_id)
    render :new
  end

  def create
    product_params = product_information
    @product = Product.new(product_params) 
    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end

  def product_id
    params.require(:id)
  end

  def product_information
    params.require(:product).permit(:title, :description, :price, :published, :category_id)
  end
end
