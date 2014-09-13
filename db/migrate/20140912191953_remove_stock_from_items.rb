class RemoveStockFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :stock, :integer
  end
end
