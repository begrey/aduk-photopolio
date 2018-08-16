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

ActiveRecord::Schema.define(version: 20180816152520) do

  create_table "characters", force: :cascade do |t|
    t.text     "character"
    t.text     "introduce"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "characters", ["user_id"], name: "index_characters_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "commentable_id"
    t.string   "nickname"
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",          null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "installs", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "installs", ["email"], name: "index_installs_on_email", unique: true
  add_index "installs", ["reset_password_token"], name: "index_installs_on_reset_password_token", unique: true

  create_table "likes", force: :cascade do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "likes", ["post_id"], name: "index_likes_on_post_id"
  add_index "likes", ["user_id"], name: "index_likes_on_user_id"

  create_table "mateapplies", force: :cascade do |t|
    t.string   "partner"
    t.boolean  "matching"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "mateapplies", ["user_id"], name: "index_mateapplies_on_user_id"

  create_table "new_notifications", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "videourl"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "read_marks", force: :cascade do |t|
    t.integer  "readable_id"
    t.string   "readable_type", null: false
    t.integer  "reader_id"
    t.string   "reader_type",   null: false
    t.datetime "timestamp"
  end

  add_index "read_marks", ["reader_id", "reader_type", "readable_type", "readable_id"], name: "read_marks_reader_readable_index", unique: true

  create_table "stuapps", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "stu_id"
    t.integer  "stupost_writer"
    t.text     "writer"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "stus", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.string   "country"
    t.string   "writer"
    t.boolean  "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tradeapplies", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "tradepost_id"
    t.boolean  "matching"
    t.integer  "user_id"
    t.integer  "partner"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tradeposts", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.text     "wantitem"
    t.boolean  "state"
    t.string   "category"
    t.string   "interest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tradescraps", force: :cascade do |t|
    t.integer  "tradepost_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "tradescraps", ["tradepost_id"], name: "index_tradescraps_on_tradepost_id"
  add_index "tradescraps", ["user_id"], name: "index_tradescraps_on_user_id"

  create_table "users", force: :cascade do |t|
    t.boolean  "admin"
    t.string   "name"
    t.string   "sex"
    t.integer  "birthyear"
    t.text     "interest"
    t.string   "kakao"
    t.string   "region"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
