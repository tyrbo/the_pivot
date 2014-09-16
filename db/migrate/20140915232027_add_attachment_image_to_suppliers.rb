class AddAttachmentImageToSuppliers < ActiveRecord::Migration
  def self.up
    change_table :suppliers do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :suppliers, :picture
  end
end
