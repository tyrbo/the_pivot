class AddSizeandStockToItemsTable < ActiveRecord::Migration
  def change
    add_column :items, :size, :string
    add_column :items, :stock, :integer
  end
end
