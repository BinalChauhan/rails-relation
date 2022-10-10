require 'rails_helper'

RSpec.describe Project, type: :model do
    project = Project.create(name: "abc", description: "opq", start_date: "2002,02,22")

    it "is valid with valid attributes" do
        expect(project).to be_valid
    end

    it "is not valid without name" do
        project.name = nil
        expect(project).not_to be_nil
    end

    it "is not valid without description" do
        project.description = nil
        expect(project).not_to be_nil
    end

    it "is not valid without start_date" do
        project.start_date = nil
        expect(project).not_to be_nil
    end

    context 'associations' do
        it "is not valid without developer asociation" do
            should have_and_belong_to_many(:developers).class_name('Developer')
        end

        it "is not valid without tasks asociation" do
            should have_many(:tasks).class_name('Task')
        end

        it "is not valid without comments asociation" do
            should have_many(:comments).class_name('Comment')
        end
    end
end
