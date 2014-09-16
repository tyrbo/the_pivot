class AddSubOrderIdToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :sub_order_id, :integer
  end
end
