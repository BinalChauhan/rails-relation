require 'rails_helper'

RSpec.describe Employee, type: :model do
    # company = Company.create(comapny_name: "abv")
    employee = FactoryBot.create(:employee)

    it "is valid with valid attributes" do
        expect(employee).to be_valid
    end

    it "is not valid without first name" do
        employee.firstname = nil
        expect(employee).not_to be_nil
    end

    it "is not valid without last name" do
        employee.lastname = nil
        expect(employee).not_to be_nil
    end

    it "is not valid without position" do
        employee.position = nil
        expect(employee).not_to be_nil
    end

    context 'associations' do
        it "is not valid without company asociation" do
            should belong_to(:company).class_name('Company')
        end
    end
end
