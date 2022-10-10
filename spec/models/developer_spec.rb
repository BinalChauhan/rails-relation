require 'rails_helper'

RSpec.describe Developer, type: :model do
    developer = Developer.create(name: "binal", email: "ab@gmail.com", skill_level: "bigener", categories: "back-end", experience: "above 5 year", language: "ROR")

    it "is valid with valid attributes" do
        expect(developer).to be_valid
    end

    it "is not valid without name" do
        developer.name = nil
        expect(developer).not_to be_nil
    end

    it "is not valid without email" do
        developer.email = nil
        expect(developer).not_to be_nil
    end

    it "is not valid without skill_level" do
        developer.skill_level = nil
        expect(developer).not_to be_nil
    end

    it "is not valid without categories" do
        developer.categories = nil
        expect(developer).not_to be_nil
    end

    it "is not valid without experience" do
        developer.experience = nil
        expect(developer).not_to be_nil
    end

    it "is not valid without language" do
        developer.language = nil
        expect(developer).not_to be_nil
    end

    context 'associations' do
        it "is not valid without project asociation" do
            should have_and_belong_to_many(:projects).class_name('Project')
        end
    end
end
