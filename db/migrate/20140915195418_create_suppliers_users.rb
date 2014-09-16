class CreateSuppliersUsers < ActiveRecord::Migration
  def change
    create_table :suppliers_users do |t|
      t.integer :user_id
      t.integer :supplier_id
      t.string :role
    end
  end
end
