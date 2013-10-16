class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :role
      t.text :favorites
      t.string :source
      t.hstore :token
      t.string :email

      t.timestamps
    end
  end
end
