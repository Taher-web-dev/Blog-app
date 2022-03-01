class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :confirmation_token, :string
    add_index :users, :confirmation_token
    add_column :users, :confirmed_at, :date
    add_column :users, :confirmation_sent_at, :date
    add_column :users, :unconfirmed_email, :string
  end
end
