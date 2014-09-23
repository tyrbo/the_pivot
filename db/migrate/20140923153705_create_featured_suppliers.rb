class CreateFeaturedSuppliers < ActiveRecord::Migration
  def change
    create_table :featured_suppliers do |t|
      t.integer :supplier_id
    end
  end
end
