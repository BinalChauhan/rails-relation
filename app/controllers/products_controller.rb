class ProductsController < ApplicationController
    def index
        @pagy, @products = pagy(Product.all,items: 6,link_extra: 'data-remote="true"')
        respond_to do |format|
            format.html
            format.js
        end
    end
    def new
        @product = Product.new
    end
    def create
        @product = Product.new(product_pera)
        if @product.save
            ProductRegisterJob.perform_later({product_id:  @product.id, account_id: current_account.id })
            redirect_to product_path(@product)
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
