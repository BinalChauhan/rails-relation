require 'rails_helper'

RSpec.describe CartItem, type: :model do
    product = Product.new(id: 1,name: "bg", price: 123, description: "dwef", rating: 4, brand: "drr")
    cart = Cart.new(id: 1, account_id: 1)
    cartitem = CartItem.new(id: 1, product_id: 2, cart_id: cart.id)

    it "is valid with valid attributes" do
        expect(cartitem).to be_valid
    end

    it "is not valid without product id" do
        cartitem.product_id = nil
        expect(cartitem).to_not be_valid
    end

    context "associations" do
        it "is not valid without cart asociation" do
            should belong_to(:cart).class_name('Cart')
        end

        it "is not valid without product" do
            should belong_to(:product).class_name('Product')
        end
    end
end


