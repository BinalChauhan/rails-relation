class RemoveStatusToPost < ActiveRecord::Migration[6.1]
  def change
    reversible do |t|
      remove_column :posts,:status
    end
  end
end
