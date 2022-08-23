class CreateSubtasks < ActiveRecord::Migration[6.1]
  def change
    create_table :subtasks do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
