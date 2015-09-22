# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150919104331) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "first_name",      limit: 50
    t.string   "last_name",       limit: 50
    t.string   "email",           limit: 255, default: "", null: false
    t.string   "username",        limit: 25
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "admin_users", ["username"], name: "index_admin_users_on_username", using: :btree

  create_table "apps", force: :cascade do |t|
    t.integer  "app_id",             limit: 4
    t.string   "title",              limit: 255
    t.string   "permalink",          limit: 255
    t.integer  "position",           limit: 4
    t.string   "category",           limit: 255
    t.string   "content_type",       limit: 255,   default: "app"
    t.integer  "visible",            limit: 4,     default: 0
    t.text     "content",            limit: 65535
    t.string   "yUrl",               limit: 255,   default: "none"
    t.string   "dUrl",               limit: 255,   default: "none"
    t.string   "keywords",           limit: 255,   default: "Games Applications"
    t.string   "down_link",          limit: 255
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "apps", ["app_id"], name: "index_apps_on_app_id", using: :btree
  add_index "apps", ["category"], name: "index_apps_on_category", using: :btree
  add_index "apps", ["permalink"], name: "index_apps_on_permalink", using: :btree
  add_index "apps", ["title"], name: "index_apps_on_title", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "post_id",            limit: 4
    t.string   "title",              limit: 255
    t.string   "permalink",          limit: 255
    t.integer  "position",           limit: 4
    t.string   "category",           limit: 255
    t.string   "content_type",       limit: 255,   default: "post"
    t.integer  "visible",            limit: 4,     default: 0
    t.text     "content",            limit: 65535
    t.string   "keywords",           limit: 255,   default: "News information entertainment eduction"
    t.string   "yUrl",               limit: 255,   default: "none"
    t.string   "dUrl",               limit: 255,   default: "none"
    t.datetime "created_at",                                                                           null: false
    t.datetime "updated_at",                                                                           null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "posts", ["category"], name: "index_posts_on_category", using: :btree
  add_index "posts", ["permalink"], name: "index_posts_on_permalink", using: :btree
  add_index "posts", ["post_id"], name: "index_posts_on_post_id", using: :btree
  add_index "posts", ["title"], name: "index_posts_on_title", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
