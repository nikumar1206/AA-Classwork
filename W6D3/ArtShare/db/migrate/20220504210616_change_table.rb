class ChangeTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :artworkshares, :artwork_shares
  end
end
