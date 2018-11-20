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

ActiveRecord::Schema.define(version: 2018_11_16_143539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deeds", force: :cascade do |t|
    t.string "position"
    t.string "sign"
    t.string "punishment"
    t.string "status"
    t.integer "detriment"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "deputy_id"
    t.bigint "region_id"
    t.string "links", array: true
    t.index ["deputy_id"], name: "index_deeds_on_deputy_id"
    t.index ["region_id"], name: "index_deeds_on_region_id"
  end

  create_table "deputies", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "patronymic"
    t.string "current_position"
    t.string "photo_href"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "region_code"
    t.string "region_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "deeds", "deputies"
  add_foreign_key "deeds", "regions"
end
