require 'rails_helper'

RSpec.describe "routes for Tasks", type: :routing do
    it "routes /tasks to the task controller" do
        expect(get: "/projects/2/tasks/new").to route_to(controller: 'tasks', action: 'new', project_id: '2')
    end
end
