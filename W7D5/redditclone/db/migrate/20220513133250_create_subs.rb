class CreateSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.text :description
      t.integer :mod_id, null: false

      t.timestamps
    end
    add_index :subs, :title, unique: true
    add_index :subs, :mod_id, unique: true
  end
end
