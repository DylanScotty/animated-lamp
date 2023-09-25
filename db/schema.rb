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

ActiveRecord::Schema[7.0].define(version: 2023_09_24_230307) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amusement_parks", force: :cascade do |t|
    t.string "name"
    t.integer "admission_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mechanic_rides", force: :cascade do |t|
    t.bigint "mechanic_id", null: false
    t.bigint "ride_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mechanic_id"], name: "index_mechanic_rides_on_mechanic_id"
    t.index ["ride_id"], name: "index_mechanic_rides_on_ride_id"
  end

  create_table "mechanics", force: :cascade do |t|
    t.string "name"
    t.integer "years_experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rides", force: :cascade do |t|
    t.string "name"
    t.integer "thrill_rating"
    t.boolean "open"
    t.bigint "amusement_park_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amusement_park_id"], name: "index_rides_on_amusement_park_id"
  end

  add_foreign_key "mechanic_rides", "mechanics"
  add_foreign_key "mechanic_rides", "rides"
  add_foreign_key "rides", "amusement_parks"
end
