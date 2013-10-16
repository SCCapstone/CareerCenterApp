class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :to
      t.integer :from
      t.string :from_role
      t.boolean :read
      t.text :content

      t.timestamps
    end
  end
end
