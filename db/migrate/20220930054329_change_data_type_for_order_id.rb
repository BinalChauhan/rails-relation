class ChangeDataTypeForOrderId < ActiveRecord::Migration[6.1]

  def change
      change_column :orders,:order_id,:string
  end
end
