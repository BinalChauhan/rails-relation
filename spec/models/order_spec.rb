require 'rails_helper'

RSpec.describe Order, type: :model do
    product = Product.create(name: "bg", price: 123, description: "dwef", rating: 4, brand: "drr")
    p product
    order = Order.create(order_id: 12345678, address: "fyff", phone_no: 12334, product_id: product, account_id: 1)

    it "is valid with valid attributes" do
        expect(order).to be_valid
    end

    it "is not without order_id" do
        order.order_id = nil
        expect(order).not_to be_nil
    end

    it "is not without address" do
        order.address= nil
        expect(order).not_to be_nil
    end

    it "is not without phone_no" do
        order.phone_no= nil
        expect(order).not_to be_nil
    end

    it "is not without product_id" do
        order.product_id= nil
        expect(order).not_to be_nil
    end

    it "is not without account_id" do
        order.account_id= nil
        expect(order).not_to be_nil
    end

end
