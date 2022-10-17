ActiveAdmin.register Account do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :firstname, :lastname, :slug, :customer_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :firstname, :lastname, :slug, :customer_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
      selectable_column
      column :id
      column :email
      column :firstname
      column :lastname
      column :created_at
      column :updated_at
      actions
  end

  show do
      attributes_table do
            row :email
            row :reset_password_token
            row :reset_password_sent_at
            row :remember_created_at
            row :created_at
            row :updated_at
            row :firstname
            row :lastname
            row :slug
            table_for account.orders do
                column "orders" do |order|
                    order.product
                end
            end
      end
      active_admin_comments
  end
end
