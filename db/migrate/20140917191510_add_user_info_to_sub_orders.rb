class AddUserInfoToSubOrders < ActiveRecord::Migration
  def change
    add_column :sub_orders, :provider_name, :string
    add_column :sub_orders, :provider_email, :string
  end
end
