class CheckoutsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        @product = Product.find_by(id: params[:product_id])
        @session = Stripe::Checkout::Session.create({
                   payment_method_types: ['card'],
                   line_items: [{
                        price_data: {
                            currency: 'usd',
                            product_data: {
                                name: @product.name,
                                images: [url_for(@product.image)],
                            },
                            unit_amount: @product.price,
                        },
                        quantity: 1
                    }],
                   phone_number_collection: {
                       enabled: true
                   },
                   metadata: {
                       product_id: @product.id,
                       account_id: current_account.id
                   },
                   customer_email: current_account.email,
                   mode: 'payment',
                   success_url: "https://7ae6-2401-4900-1f3f-91f4-4fe5-17bb-4cb5-6c90.ngrok.io" + '/success',
                   cancel_url: "https://7ae6-2401-4900-1f3f-91f4-4fe5-17bb-4cb5-6c90.ngrok.io"  + '/cancel',
               })
        respond_to do |format|
            format.js
        end
    end
end
