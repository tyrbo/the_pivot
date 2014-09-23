class FixAddressId < ActiveRecord::Migration
  def change
    remove_column :orders, :delivery_address
    remove_column :orders, :billing_address
    remove_column :sub_orders, :delivery_address
    remove_column :sub_orders, :billing_address
    add_column :orders, :delivery_address_id, :integer
    add_column :orders, :billing_address_id, :integer
    add_column :sub_orders, :delivery_address_id, :integer
    add_column :sub_orders, :billing_address_id, :integer
  end
end
