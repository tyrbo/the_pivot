class ChangeItemPriceToInteger < ActiveRecord::Migration
  def change
    remove_column :items, :price, :decimal
    add_column :items, :price, :integer
  end
end
