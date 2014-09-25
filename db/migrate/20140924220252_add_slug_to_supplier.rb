class AddSlugToSupplier < ActiveRecord::Migration
  def change
    add_column :suppliers, :slug, :string
  end
end
