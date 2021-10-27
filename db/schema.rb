# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_27_092818) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lines", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.string "sku"
    t.string "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_lines_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "acetate_id"
    t.string "shipping_country"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.bigint "line_id", null: false
    t.string "prescription_type"
    t.string "lens_color"
    t.string "left_sph"
    t.string "right_sph"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["line_id"], name: "index_prescriptions_on_line_id"
  end

  add_foreign_key "lines", "orders"
  add_foreign_key "prescriptions", "lines"
end
