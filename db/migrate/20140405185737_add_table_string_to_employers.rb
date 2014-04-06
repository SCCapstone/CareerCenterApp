class AddTableStringToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :table_s, :string
  end
end
