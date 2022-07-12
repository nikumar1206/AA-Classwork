class CreatePostSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :post_subs do |t|
      t.belongs_to :post, foreign_key: true
      t.belongs_to :sub, foreign_key: true

      t.timestamps
    end
  end
end
