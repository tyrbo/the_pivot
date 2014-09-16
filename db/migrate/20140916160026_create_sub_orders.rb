class CreateSubOrders < ActiveRecord::Migration
  def change
    create_table :sub_orders do |t|
      t.integer :order_id
      t.integer :supplier_id

      t.timestamps
    end
  end
end
