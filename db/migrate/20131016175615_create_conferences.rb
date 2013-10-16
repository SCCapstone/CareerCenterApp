class CreateConferences < ActiveRecord::Migration
  def change
    create_table :conferences do |t|
      t.string :name
      t.string :location
      t.text :description
      t.string :last_edit

      t.timestamps
    end
  end
end
