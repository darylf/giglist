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

ActiveRecord::Schema.define(version: 20150807024239) do

  create_table "artists", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "artists", ["name"], name: "index_artists_on_name"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.date     "start_date",                 null: false
    t.integer  "venue_id",                   null: false
    t.boolean  "cancelled",  default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "tour_id"
  end

  add_index "events", ["tour_id"], name: "index_events_on_tour_id"
  add_index "events", ["venue_id"], name: "index_events_on_venue_id"

  create_table "lineups", force: :cascade do |t|
    t.integer  "artist_id",              null: false
    t.integer  "event_id",               null: false
    t.integer  "sort_order", default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "lineups", ["artist_id", "event_id", "sort_order"], name: "index_lineups_on_artist_id_and_event_id_and_sort_order"
  add_index "lineups", ["artist_id", "event_id"], name: "index_lineups_on_artist_id_and_event_id"

  create_table "tours", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "venues", ["name"], name: "index_venues_on_name"

end
