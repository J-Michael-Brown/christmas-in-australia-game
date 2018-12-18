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

ActiveRecord::Schema.define(version: 2018_12_18_162222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "location_id"
    t.boolean "found"
  end

  create_table "locations", force: :cascade do |t|
    t.string "sign"
    t.integer "objective_id"
    t.text "transition"
    t.text "pre_description"
    t.text "post_description"
    t.boolean "puzzle_solved"
  end

  create_table "objectives", force: :cascade do |t|
    t.integer "player_id"
    t.text "description"
    t.boolean "complete"
  end

  create_table "options", force: :cascade do |t|
    t.string "action"
    t.integer "location_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "location_id"
    t.integer "objective_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
