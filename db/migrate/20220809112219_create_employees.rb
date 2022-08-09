class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :lastname
      t.string :position

      t.timestamps
    end
  end
end
