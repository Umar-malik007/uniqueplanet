class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.integer "post_id"
      t.string "title"
      t.string "permalink"
      t.integer "position"
      t.string "category"
      t.string "content_type", :default => "post"
      t.integer "visible", :default => false
      t.text 'content'
      t.string 'keywords', :default => "News information entertainment eduction"
      t.string 'yUrl', :default => "none"
      t.string 'dUrl', :default => "none"

      t.timestamps null: false
    end
    add_index("posts", "post_id")
    add_index("posts", "permalink")
    add_index("posts", "category")
    add_index("posts", "title")
  end

  def down
    drop_table :posts
  end
end
