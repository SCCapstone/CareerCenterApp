class AddExpirationToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :expiration, :datetime
    add_column :messages, :lifetime, :integer
  end
end
