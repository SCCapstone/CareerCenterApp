class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :name
      t.text :website
      t.text :description
      t.text :majors
      t.string :email
      t.text :positions
      t.text :tips
      t.datetime :created_at
      t.datetime :updated_at
      t.string :last_edit
      t.integer :table_id
      t.integer :conference_id

      t.timestamps
    end
  end
end
