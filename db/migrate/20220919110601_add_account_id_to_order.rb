class AddAccountIdToOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :account, foreign_key: true
  end
end
