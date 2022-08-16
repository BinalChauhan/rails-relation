class CreateDevelopers < ActiveRecord::Migration[6.1]
  def change
    create_table :developers do |t|
      t.string :name
      t.string :email
      t.string :skill_level
      t.text :categories
      t.string :experience
      t.string :language

      t.timestamps
    end
  end
end
