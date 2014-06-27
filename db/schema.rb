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

ActiveRecord::Schema.define(version: 20140619231841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "confs", force: true do |t|
    t.string   "custom"
    t.integer  "player_id"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "feedback_count", default: 0
    t.float    "rating",         default: 0.0
  end

  add_index "confs", ["game_id"], name: "index_confs_on_game_id", using: :btree
  add_index "confs", ["player_id"], name: "index_confs_on_player_id", using: :btree

  create_table "feedbacks", force: true do |t|
    t.integer  "rating"
    t.text     "text"
    t.integer  "conf_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_id"
  end

  add_index "feedbacks", ["conf_id"], name: "index_feedbacks_on_conf_id", using: :btree
  add_index "feedbacks", ["game_id"], name: "index_feedbacks_on_game_id", using: :btree
  add_index "feedbacks", ["player_id"], name: "index_feedbacks_on_player_id", using: :btree

  create_table "games", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "params", force: true do |t|
    t.string   "name"
    t.float    "value"
    t.integer  "conf_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "params", ["conf_id"], name: "index_params_on_conf_id", using: :btree

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "custom"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["game_id"], name: "index_players_on_game_id", using: :btree

end
