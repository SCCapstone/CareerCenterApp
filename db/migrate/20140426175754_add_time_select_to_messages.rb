class AddTimeSelectToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :display_till, :datetime
  end
end
