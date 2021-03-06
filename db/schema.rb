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

ActiveRecord::Schema.define(version: 20150620192434) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.datetime "updated_at", null: false
    t.datetime "created_at", null: false
    t.string   "city"
  end

  create_table "parking_places", force: :cascade do |t|
    t.string   "ulica"
    t.string   "spz"
    t.integer  "location_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "parking_places", ["location_id"], name: "index_parking_places_on_location_id", using: :btree
  add_index "parking_places", ["user_id"], name: "index_parking_places_on_user_id", using: :btree

  create_table "rentals", force: :cascade do |t|
    t.integer  "price"
    t.integer  "duration"
    t.integer  "parking_place_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.datetime "to"
    t.datetime "from"
  end

  add_index "rentals", ["parking_place_id"], name: "index_rentals_on_parking_place_id", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.integer  "price"
    t.integer  "duration"
    t.integer  "user_id"
    t.integer  "rental_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "to"
    t.datetime "from"
  end

  add_index "reservations", ["rental_id"], name: "index_reservations_on_rental_id", using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.string   "account_number"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "parking_places", "users"
end
