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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110906000826) do

  create_table "four_oh_fours", :force => true do |t|
    t.string   "host"
    t.string   "path"
    t.string   "referer"
    t.integer  "count",      :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "four_oh_fours", ["host", "path", "referer"], :name => "index_four_oh_fours_on_host_and_path_and_referer", :unique => true
  add_index "four_oh_fours", ["path"], :name => "index_four_oh_fours_on_path"

  create_table "menu_items", :force => true do |t|
    t.integer  "position"
    t.integer  "parent_id"
    t.string   "label"
    t.string   "page_id"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_versions", :force => true do |t|
    t.integer  "page_id"
    t.integer  "version"
    t.string   "url_tag"
    t.string   "title"
    t.string   "html_title"
    t.string   "keywords"
    t.string   "description"
    t.text     "content"
    t.boolean  "published"
    t.datetime "updated_at"
    t.datetime "created_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "url_tag"
    t.string   "title"
    t.string   "html_title"
    t.string   "keywords"
    t.string   "description"
    t.text     "content"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version"
  end

  add_index "pages", ["url_tag"], :name => "index_pages_on_url_tag"

  create_table "realtors", :force => true do |t|
    t.string   "name"
    t.string   "phone_number"
    t.string   "cell_number"
    t.string   "voicemail_number"
    t.string   "email"
    t.string   "website"
    t.string   "bio_link"
    t.string   "url_tag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "rights", :force => true do |t|
    t.string   "name"
    t.string   "controller"
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rights_roles", :id => false, :force => true do |t|
    t.integer  "right_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "perishable_token"
    t.integer  "login_count",        :default => 0, :null => false
    t.integer  "failed_login_count", :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
