class AddPhoneNumberToUser < ActiveRecord::Migration
  def change
    add_column :users, :phone_number, :string
    add_column :users, :send_texts, :boolean
  end
end
