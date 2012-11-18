class AddContactsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :contact_id, :integer
    remove_column :messages, :user_id
  end
end
