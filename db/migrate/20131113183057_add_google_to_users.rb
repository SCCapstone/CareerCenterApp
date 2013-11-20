class AddGoogleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :identifier_url, :string
    add_index :users, :identifier_url, :unique => true
  end
end
