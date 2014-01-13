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

ActiveRecord::Schema.define(version: 20140113181920) do

  create_table "admins", force: true do |t|
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.integer  "emp_code"
    t.boolean  "has_membership"
    t.integer  "lifetime_points"
    t.integer  "used_points"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "badges_sashes", force: true do |t|
    t.integer  "badge_id"
    t.integer  "sash_id"
    t.boolean  "notified_user", default: false
    t.datetime "created_at"
  end

  add_index "badges_sashes", ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id"
  add_index "badges_sashes", ["badge_id"], name: "index_badges_sashes_on_badge_id"
  add_index "badges_sashes", ["sash_id"], name: "index_badges_sashes_on_sash_id"

  create_table "beer_styles", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "visible"
    t.text     "area"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discounts", force: true do |t|
    t.integer  "reward_id"
    t.integer  "user_id"
    t.string   "code"
    t.boolean  "used"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "drinks", force: true do |t|
    t.string   "name"
    t.string   "brewery"
    t.float    "abv"
    t.text     "description"
    t.float    "price"
    t.boolean  "visible"
    t.integer  "beer_style_id"
    t.boolean  "call_out"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.text     "brewer_description"
    t.boolean  "tracker"
    t.string   "drink_image"
    t.integer  "average"
  end

  create_table "events", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.boolean  "valid_sunday"
    t.boolean  "valid_monday"
    t.boolean  "valid_tuesday"
    t.boolean  "valid_wednesday"
    t.boolean  "valid_thursday"
    t.boolean  "valid_friday"
    t.boolean  "valid_saturday"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "games", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "released_at"
    t.string   "developer"
    t.string   "publisher"
    t.integer  "players"
    t.string   "trailer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "visible"
    t.integer  "category_id"
    t.string   "cover_art"
  end

  create_table "katy_corners", force: true do |t|
    t.string   "title"
    t.text     "brief"
    t.text     "body_document"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image1"
    t.string   "image2"
    t.string   "image3"
  end

  create_table "merit_actions", force: true do |t|
    t.integer  "user_id"
    t.string   "action_method"
    t.integer  "action_value"
    t.boolean  "had_errors",    default: false
    t.string   "target_model"
    t.integer  "target_id"
    t.boolean  "processed",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "merit_activity_logs", force: true do |t|
    t.integer  "action_id"
    t.string   "related_change_type"
    t.integer  "related_change_id"
    t.string   "description"
    t.datetime "created_at"
  end

  create_table "merit_score_points", force: true do |t|
    t.integer  "score_id"
    t.integer  "num_points", default: 0
    t.string   "log"
    t.datetime "created_at"
  end

  create_table "merit_scores", force: true do |t|
    t.integer "sash_id"
    t.string  "category", default: "default"
  end

  create_table "ratings", force: true do |t|
    t.integer  "drink_id"
    t.integer  "user_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_id"
  end

  create_table "rewards", force: true do |t|
    t.string   "name"
    t.integer  "points"
    t.boolean  "visible"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  create_table "sashes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "timelines", force: true do |t|
    t.integer  "user_id"
    t.string   "nature"
    t.integer  "game_id"
    t.integer  "drink_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trackers", force: true do |t|
    t.integer  "user_id"
    t.integer  "drink_id"
    t.integer  "points"
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.integer  "emp_code"
    t.boolean  "has_membership"
    t.integer  "lifetime_points"
    t.integer  "used_points"
    t.integer  "sash_id"
    t.integer  "level",                  default: 0
    t.integer  "membership_number"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
