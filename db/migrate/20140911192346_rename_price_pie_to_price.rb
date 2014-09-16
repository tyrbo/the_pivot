class RenamePricePieToPrice < ActiveRecord::Migration
  def change
    rename_column :items, :price_item, :price
  end
end
