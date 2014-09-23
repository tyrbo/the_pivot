class ChangeOrdersOrderTotalToInteger < ActiveRecord::Migration
  def change
    remove_column :order_items, :order_total, :decimal
    add_column :order_items, :order_total, :integer
  end
end
