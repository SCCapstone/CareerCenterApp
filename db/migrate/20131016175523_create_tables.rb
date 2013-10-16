class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :num
      t.integer :conference_id
      t.integer :employer_id
      t.string :last_edit

      t.timestamps
    end
  end
end
