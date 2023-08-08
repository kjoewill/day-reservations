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

ActiveRecord::Schema[7.0].define(version: 2023_08_08_133224) do
  create_table "assets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sort_order"
  end

  create_table "day_schedules", force: :cascade do |t|
    t.date "day"
    t.integer "asset_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_day_schedules_on_asset_id"
    t.index ["day", "asset_id"], name: "index_day_schedules_on_day_and_asset_id", unique: true
  end

  create_table "reservations", force: :cascade do |t|
    t.string "time_slot"
    t.string "description"
    t.integer "day_schedule_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_schedule_id"], name: "index_reservations_on_day_schedule_id"
  end

  add_foreign_key "day_schedules", "assets", on_delete: :cascade
  add_foreign_key "reservations", "day_schedules", on_delete: :cascade
end
