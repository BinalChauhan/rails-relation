class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_pera)
    if @product.save
      redirect_to products_path(@product)
    else
      render new, status: :unprocessable_entity
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  private
  def product_pera
    params.require(:product).permit(:name,:image,:price,:description,:rating,:brand)
  end
end
