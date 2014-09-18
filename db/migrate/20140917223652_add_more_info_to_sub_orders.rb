class AddMoreInfoToSubOrders < ActiveRecord::Migration
  def change
    add_column :order_items, :price, :integer
    add_column :sub_orders, :status, :string
    add_column :sub_orders, :delivery_address, :integer
    add_column :sub_orders, :billing_address, :integer
    add_column :orders, :billing_address, :integer
    add_column :sub_orders, :order_type, :string
  end
end
