require 'rails_helper'

RSpec.describe Company, type: :model do
    company = Company.create(comapny_name: "abv")

    it "is valid with valid attributes" do
        expect(company).to be_valid
    end

    it "is not valid without company name" do
        company.comapny_name = nil
        expect(company).not_to be_nil
    end

    context 'associations' do
        it "is not valid without employees asociation" do
            should have_many(:employees).class_name('Employee')
        end

        it "is not valid without post asociation" do
            should have_many(:posts).class_name('Post')
        end
    end
end
