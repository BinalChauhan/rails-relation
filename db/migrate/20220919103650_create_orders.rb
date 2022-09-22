class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :order_id
      t.text :address
      t.integer :phone_no

      t.timestamps
    end
  end
end
