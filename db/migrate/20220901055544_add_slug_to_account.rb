class AddSlugToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :slug, :string
    add_index :accounts, :slug, unique: true
  end
end
