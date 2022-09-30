class OrderProcessService

    def initialize(address,phone,product_id,account_id)
        @address = address
        @phone = phone
        @product_id = product_id
        @account_id = account_id
    end

    def order_create
        Order.create(order_id: SecureRandom.hex(4), address: @address, phone_no: @phone, product_id: @product_id, account_id: @account_id)
    end
end