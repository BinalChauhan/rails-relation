class AddCompanyToPost < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :company, foreign_key: true
  end
end
