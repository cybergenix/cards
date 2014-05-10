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

ActiveRecord::Schema.define(version: 20140510014826) do

  create_table "card_reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "card_id"
    t.string   "type"
    t.integer  "rating"
    t.integer  "interval"
    t.integer  "ease"
    t.float    "time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "card_reviews", ["card_id"], name: "index_card_reviews_on_card_id"
  add_index "card_reviews", ["type"], name: "index_card_reviews_on_type"
  add_index "card_reviews", ["user_id"], name: "index_card_reviews_on_user_id"

  create_table "card_types", force: true do |t|
    t.integer  "note_id"
    t.string   "title"
    t.text     "front_template"
    t.text     "back_template"
    t.text     "styling"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "card_types", ["note_id"], name: "index_card_types_on_note_id"

  create_table "cards", force: true do |t|
    t.integer  "note_id"
    t.integer  "card_type_id"
    t.text     "front"
    t.text     "back"
    t.datetime "due"
    t.integer  "position"
    t.integer  "facebook_friend_id"
    t.integer  "user_id"
    t.float    "average_review_time"
    t.integer  "reviews_count"
    t.integer  "lapses_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["card_type_id"], name: "index_cards_on_card_type_id"
  add_index "cards", ["due"], name: "index_cards_on_due"
  add_index "cards", ["facebook_friend_id"], name: "index_cards_on_facebook_friend_id"
  add_index "cards", ["note_id"], name: "index_cards_on_note_id"
  add_index "cards", ["position"], name: "index_cards_on_position"
  add_index "cards", ["user_id"], name: "index_cards_on_user_id"

  create_table "facebook_friends", force: true do |t|
    t.string   "name"
    t.string   "photo"
    t.string   "work"
    t.string   "location"
    t.string   "birthday"
    t.string   "college"
    t.string   "significant_other"
    t.integer  "user_id"
    t.integer  "facebook_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "facebook_friends", ["facebook_id"], name: "index_facebook_friends_on_facebook_id"
  add_index "facebook_friends", ["name"], name: "index_facebook_friends_on_name"
  add_index "facebook_friends", ["user_id"], name: "index_facebook_friends_on_user_id"

  create_table "notes", force: true do |t|
    t.string   "title"
    t.string   "fields"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
