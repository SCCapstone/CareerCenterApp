class AddLocationToEmployer < ActiveRecord::Migration
  def change
    add_column :employers, :location, :string
  end
end
