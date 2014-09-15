class Items < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string      :title
      t.string      :description
      t.decimal     :price_item,  precision: 4, scale: 2
      t.timestamps
    end
  end
end
