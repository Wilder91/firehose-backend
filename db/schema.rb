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

ActiveRecord::Schema[7.0].define(version: 2023_10_28_033727) do
  create_table "demographic_cards", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string "name"
    t.string "population"
    t.string "white"
    t.string "black_AfAm"
    t.string "amInd_AkNa"
    t.string "asian"
    t.string "natHaw_Pac"
    t.string "other_Race"
    t.string "twoOrMore"
    t.string "isp_Lat"
    t.string "housing"
    t.string "occupied"
    t.string "unoccupied"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "permits", force: :cascade do |t|
    t.string "address"
    t.string "description"
    t.string "neighborhood"
    t.string "issued_date"
    t.string "case_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vacants", force: :cascade do |t|
    t.string "address"
    t.string "neighborhood"
    t.string "council_district"
    t.string "typology"
    t.string "datenotice"
    t.string "datecancel"
    t.string "owner_abbr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
