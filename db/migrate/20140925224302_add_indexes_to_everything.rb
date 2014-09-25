class AddIndexesToEverything < ActiveRecord::Migration
  def change
    add_index :cart_items, :cart_id
    add_index :cart_items, :item_id

    add_index :featured_suppliers, :supplier_id

    add_index :items, :supplier_id

    add_index :order_items, :order_id
    add_index :order_items, :item_id
    add_index :order_items, :sub_order_id

    add_index :orders, :user_id
    add_index :orders, :delivery_address_id
    add_index :orders, :billing_address_id

    add_index :pending_admins, :supplier_id
    add_index :pending_admins, :user_id

    add_index :sub_orders, :order_id
    add_index :sub_orders, :supplier_id
    add_index :sub_orders, :delivery_address_id
    add_index :sub_orders, :billing_address_id

    add_index :suppliers_users, :user_id
    add_index :suppliers_users, :supplier_id

    add_index :user_addresses, :user_id
    add_index :user_addresses, :address_id
  end
end
