class AddProductIdToOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :product, foreign_key: true
  end
end
