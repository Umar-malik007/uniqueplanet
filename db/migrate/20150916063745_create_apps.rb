class CreateApps < ActiveRecord::Migration
  def up
    create_table :apps do |t|
      t.integer "app_id"
      t.string "title"
      t.string "permalink"
      t.integer "position"
      t.string "category"
      t.string "content_type", :default => "app"
      t.integer "visible", :default => false
      t.text 'content'
      t.string 'yUrl', :default => "none"
      t.string 'dUrl', :default => "none"
      t.string 'keywords', :default => "Games Applications"
      t.string 'down_link'

      t.timestamps null: false
    end
    add_index("apps", "app_id")
    add_index("apps", "permalink")
    add_index("apps", "category")
    add_index("apps", "title")
  end

  def down
    drop_table :apps
  end
end

