class OrdersController < ApplicationController

    before_action :find_product, only: [:new, :index]
    before_action :find_account,only: [:new]

    def index
        @pagy1, @orders = pagy(Order.all, items: 3)
    end

    def new
        @order = Order.new
    end

    private
    def order_pera
        params.require(:order).permit(:address, :phone_no, :product_id, :account_id)
    end

    def find_product
        @product = Product.find_by(id: params[:product_id])
    end
    
    def find_account
        @account = Account.find_by(id: params[:account_id])
    end
end