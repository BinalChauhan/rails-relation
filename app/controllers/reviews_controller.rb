class ReviewsController < ApplicationController

    def index
        @product = Product.find_by(id: params[:product_id])
        # @order = Order.find_by(id: params[:order_id])
    end

    def new
        @product = Product.find_by(id: params[:product_id])
        @order = Order.find_by(id: params[:order_id])
        @review = Review.new
    end

    def create
        @product = Product.find_by(id: params[:product_id])
        @review = Review.create!(review_pera)
        if @review.save
            redirect_to orders_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private
    def review_pera
        params.require(:review).permit(:content, :product_id)
    end
end
