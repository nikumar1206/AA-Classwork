class Changetable3 < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :session_token, :string, uniqueness: true
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
