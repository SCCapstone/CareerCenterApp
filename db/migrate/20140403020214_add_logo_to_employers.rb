class AddLogoToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :logo, :string
  end
end
