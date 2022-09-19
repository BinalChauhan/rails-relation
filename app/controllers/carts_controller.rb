class CartsController < ApplicationController

    def index
<<<<<<< HEAD
        @carts = current_account.cart
    end

    def create
        p current_account
=======
        @current_account_cart = current_account.cart
    end
    def create
>>>>>>> f2ef46f9e509c7427def72ec559949aab7b8df4b
        if(current_account.cart.nil?)
            @cart = Cart.create(account_id: current_account.id)
            @cart_item = @cart.cart_items.create(cart_id:@cart,product_id: params[:product_id])
            if @cart.save && @cart_item.save
                redirect_to carts_path
            else
                render root_path, status: :unprocessable_entity
            end
        else
            @cart = current_account.cart
            @cart_item = @cart.cart_items.create(cart_id: @cart,product_id: params[:product_id])
<<<<<<< HEAD
=======
>>>>>>> f2ef46f9e509c7427def72ec559949aab7b8df4b
            if @cart_item.save
                redirect_to carts_path
            else
                render root_path, status: :unprocessable_entity
            end
        end
    end
<<<<<<< HEAD

=======
>>>>>>> f2ef46f9e509c7427def72ec559949aab7b8df4b
    def destroy
        @cart_item = CartItem.find_by(id: params[:id])
        @cart_item.destroy
        redirect_to carts_path, status: :see_other
    end
end
