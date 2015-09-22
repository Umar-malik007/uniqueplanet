class CreateAdminUsers < ActiveRecord::Migration
  def up
    create_table :admin_users do |t|
      t.column "first_name", :string, :limit => 50
      t.string "last_name", :limit => 50
      t.string "email", :default => "", :null => false
      t.string "username", :limit => 25
      t.string "password_digest"

      t.timestamps null: false
    end
    add_index("admin_users", "username")
  end

  def down
    drop_table :admin_users
  end
end
