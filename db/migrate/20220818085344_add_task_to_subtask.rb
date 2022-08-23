class AddTaskToSubtask < ActiveRecord::Migration[6.1]
  def change
    add_reference :subtasks, :task, foreign_key: true
  end
end
