class WebhooksController < ApplicationController
    skip_before_action :verify_authenticity_token
    skip_before_action :authenticate_account!

    def create
        payload = request.body.read
        event = nil
        begin
            event = Stripe::Event.construct_from(
                JSON.parse(payload, symbolize_names: true)
            )
        rescue JSON::ParserError => e
            status 400
            return
        end
        # Handle the event
        case event.type
        when 'checkout.session.completed'
            order_phone = order_params[:customer_details][:phone]
            order_address = order_params[:customer_details][:address][:city]
            order_product_id = order_params[:metadata][:product_id]
            order_account_id = order_params[:metadata][:account_id]
            OrderProcessService.new(order_address, order_phone, order_product_id, order_account_id).order_create
        end
        render json: { message: 'success' }
    end

    def order_params
        params.require(:data).require(:object)
    end
end
