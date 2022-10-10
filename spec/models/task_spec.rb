require 'rails_helper'

RSpec.describe Task, type: :model do
    task = Task.create(title: "gfgfg", estimated_hour: 2, project_id: 1)

    it "is valid with valid attributes" do
        expect(task).to be_valid
    end

    it "is not valid without title" do
        task.title = nil
        expect(task).not_to be_nil
    end

    it "is not valid without title" do
        task.estimated_hour = nil
        expect(task).not_to be_nil
    end

    it "is not valid without title" do
        task.project_id = nil
        expect(task).not_to be_nil
    end

    context "assosiations" do
        it "is not valid without project asociation" do
            should belong_to(:project).class_name('Project')
        end

        it "is not valid without subtasks asociation" do
            should have_many(:subtasks).class_name('Subtask')
        end

        it "is not valid without project asociation" do
            should have_many(:comments).class_name('Comment')
        end
    end
end
