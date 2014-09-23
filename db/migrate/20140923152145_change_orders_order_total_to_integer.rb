class ChangeOrdersOrderTotalToInteger < ActiveRecord::Migration
  def change
    remove_column :order_items, :order_total, :decimal, { precision: 4, scale: 2 }
    add_column :order_items, :order_total, :integer
  end
end
