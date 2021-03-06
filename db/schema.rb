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

ActiveRecord::Schema.define(version: 20150417185202) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title",           null: false
    t.text     "description",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url_index"
    t.string   "image_url_show"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "body",       null: false
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["project_id"], name: "index_comments_on_project_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.string   "sub_photo_file_name"
    t.string   "sub_photo_content_type"
    t.integer  "sub_photo_file_size"
    t.datetime "sub_photo_updated_at"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photos", ["project_id"], name: "index_photos_on_project_id", using: :btree

  create_table "pledges", force: :cascade do |t|
    t.integer "tier_id"
    t.integer "user_id"
  end

  add_index "pledges", ["tier_id", "user_id"], name: "index_pledges_on_tier_id_and_user_id", unique: true, using: :btree
  add_index "pledges", ["tier_id"], name: "index_pledges_on_tier_id", using: :btree
  add_index "pledges", ["user_id"], name: "index_pledges_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title",                             null: false
    t.text     "description",                       null: false
    t.datetime "end_date",                          null: false
    t.integer  "goal",                    limit: 8, null: false
    t.integer  "user_id",                           null: false
    t.integer  "category_id",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "main_photo_file_name"
    t.string   "main_photo_content_type"
    t.integer  "main_photo_file_size"
    t.datetime "main_photo_updated_at"
  end

  add_index "projects", ["category_id", "title"], name: "index_projects_on_category_id_and_title", unique: true, using: :btree
  add_index "projects", ["category_id"], name: "index_projects_on_category_id", using: :btree
  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "tiers", force: :cascade do |t|
    t.integer  "project_id",    null: false
    t.text     "rewards",       null: false
    t.datetime "delivery_date", null: false
    t.integer  "amount",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tiers", ["project_id"], name: "index_tiers_on_project_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "session_token",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
