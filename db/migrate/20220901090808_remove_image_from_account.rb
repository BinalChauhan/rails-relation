class RemoveImageFromAccount < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :image, :string
  end
end
