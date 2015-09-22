class AddImageColumnToUsers < ActiveRecord::Migration
  def up
    add_attachment :apps, :image
  end

  def down
    remove_attachment :apps, :image
  end
end
