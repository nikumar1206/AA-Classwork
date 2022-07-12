class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.belongs_to :sub, foreign_key: true, null: false, index: true
      t.integer :author_id, null: false

      t.timestamps
    end
    add_index :posts, :title, unique: true
    add_index :posts, :author_id, unique: true
  end
end
