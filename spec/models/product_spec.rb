require 'rails_helper'

RSpec.describe Product, type: :model do
    product = Product.new(name: "bg", price: 123, description: "dwef", rating: 4, brand: "drr")

    it "is valid with valid attributes" do
        expect(product).to be_valid
    end

    it "is not valid without name" do
        product.name = nil
        expect(product).not_to be_nil
    end

    it "is not valid without price" do
        product.price = nil
        expect(product).not_to be_nil
    end

    it "is not valid without description" do
        product.description = nil
        expect(product).not_to be_nil
    end

    it "is not valid without rating" do
        product.rating = nil
        expect(product).not_to be_nil
    end

    it "is not valid without rating" do
        product.brand = nil
        expect(product).not_to be_nil
    end

    context 'associations' do
        it "is not valid without order asociation" do
            should have_many(:orders).class_name('Order')
        end
    end
end
