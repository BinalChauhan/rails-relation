require 'rails_helper'

RSpec.describe Account, type: :model do
    account1 = FactoryBot.create(:account)
    p account1
    it "is valid with valid attributes" do
        expect(account1).to be_valid
    end

    it "is not valid without a firstname" do
        account1.firstname = nil
        expect(account1).to_not be_valid
    end

    it "is not valid without a lastname" do
        account1.lastname = nil
        expect(account1).to_not be_valid
    end

    it "is not valid without a email" do
        account1.email = nil
        expect(account1).to_not be_valid
    end

    it "is not valid without a password" do
        account1.password = nil
        expect(account1).to_not be_valid
    end

    context 'associations' do
        it "is not valid without order asociation" do
            should have_many(:orders).class_name('Order')
        end

        it "is not valid without cart asociation" do
           should have_one(:cart).class_name('Cart')
        end
    end
end
