class AddNameToAccounts < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :firstname, :string
    add_column :accounts, :lastname, :string
  end
end
