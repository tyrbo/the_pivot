class CreateAddress < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :city
      t.string :state
      t.string :zip
      t.string :street
      t.boolean :billing
      t.boolean :shipping
    end
  end
end
