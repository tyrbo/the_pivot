class AddEnabledToSupplier < ActiveRecord::Migration
  def change
    add_column :suppliers, :enabled, :boolean, default: false
  end
end
