class Changetable < ActiveRecord::Migration[5.2]
  def change
    rename_table :car_rental_requests, :cat_rental_requests
  end
end
