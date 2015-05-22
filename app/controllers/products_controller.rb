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

  def update
    @product = Product.find(product_id)

    if @product.update(product_params)
      redirect_to edit_product_url(@product)
    else
      render :new
    end
  end

  def create
    @product = Product.new(product_params) 
    if @product.save
      redirect_to products_url
    else
      render :new
    end
  end
  
  def destroy
    @product = Product.find(product_id) 

    if @product.destroy
      redirect_to products_url
    else
      raise "There is an error while trying to delete product id: #{@product.id}"
    end
  end

  private

  def product_id
    params.require(:id)
  end

  def product_params
    params.require(:product).permit(:title, 
                                    :description, 
                                    :price, 
                                    :published, 
                                    :category_id)
  end
end
