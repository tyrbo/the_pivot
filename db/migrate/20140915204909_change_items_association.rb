class ChangeItemsAssociation < ActiveRecord::Migration
  def change
    rename_column :items, :user_id, :supplier_id
  end
end
