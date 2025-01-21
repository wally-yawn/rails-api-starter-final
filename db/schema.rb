# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2025_01_21_204404) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "itineraries", force: :cascade do |t|
    t.string "title", null: false
    t.date "date", null: false
    t.string "img_url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itinerary_shows", force: :cascade do |t|
    t.bigint "itineraries_id", null: false
    t.bigint "shows_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["itineraries_id"], name: "index_itinerary_shows_on_itineraries_id"
    t.index ["shows_id"], name: "index_itinerary_shows_on_shows_id"
  end

  create_table "shows", force: :cascade do |t|
    t.string "name", null: false
    t.date "date", null: false
    t.time "time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_itineraries", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "user_itineraries_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_itineraries_on_user_id"
    t.index ["user_itineraries_id"], name: "index_user_itineraries_on_user_itineraries_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "itinerary_shows", "itineraries", column: "itineraries_id"
  add_foreign_key "itinerary_shows", "shows", column: "shows_id"
  add_foreign_key "user_itineraries", "user_itineraries", column: "user_itineraries_id"
  add_foreign_key "user_itineraries", "users"
end
