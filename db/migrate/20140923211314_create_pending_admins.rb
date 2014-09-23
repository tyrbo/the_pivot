class CreatePendingAdmins < ActiveRecord::Migration
  def change
    create_table :pending_admins do |t|
      t.integer :supplier_id
      t.integer :user_id
    end
  end
end
