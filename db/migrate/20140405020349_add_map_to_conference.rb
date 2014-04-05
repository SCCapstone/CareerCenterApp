class AddMapToConference < ActiveRecord::Migration
  def change
    add_column :conferences, :map, :string
  end
end
