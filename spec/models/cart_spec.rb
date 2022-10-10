require 'rails_helper'

RSpec.describe Cart, type: :model do
    subject {
        described_class.new(account_id: 1)
    }
    it "is valid with valid attributes" do
        expect(subject).to be_valid
    end

    it "is not valid without account id" do
        subject.account_id = nil
        expect(subject).to_not be_valid
    end

    context "associations" do
        it "is not valid without cart_item asociation" do
            should have_many(:cart_items).class_name('CartItem')
        end

        it "is not valid without account" do
            should belong_to(:account).class_name('Account')
        end
    end
end
