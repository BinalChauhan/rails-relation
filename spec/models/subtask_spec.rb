require 'rails_helper'

RSpec.describe Subtask, type: :model do
    subtask = Subtask.create(title: "ghfgh", description: "ggggjefw", task_id: 1)

    it "is valid with valid attributes" do
        expect(subtask).to be_valid
    end

    it "is not valid without title" do
        subtask.title = nil
        expect(subtask).not_to be_nil
    end

    it "is not valid without description" do
        subtask.description = nil
        expect(subtask).not_to be_nil
    end

    it "is not valid without task_id" do
        subtask.task_id = nil
        expect(subtask).not_to be_nil
    end
    context "assosiations" do
        it "is not valid without company asociation" do
            should belong_to(:task).class_name('Task')
        end
    end
end
