class RenamePricePieToPrice < ActiveRecord::Migration
  def change
    rename_column :items, :price_pie, :price
  end
end
