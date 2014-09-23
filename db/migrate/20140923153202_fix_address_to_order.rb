class FixAddressToOrder < ActiveRecord::Migration
  def change
    change_column :orders, :delivery_address, :integer
  end
end
