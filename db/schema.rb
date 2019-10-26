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

ActiveRecord::Schema.define(version: 2019_10_26_131129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "barcode", null: false
    t.integer "price", null: false
    t.integer "available_quantity", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["barcode"], name: "index_items_on_barcode", unique: true
    t.index ["name"], name: "index_items_on_name", unique: true
  end

  create_table "sales", force: :cascade do |t|
    t.string "order_number", null: false
    t.integer "total_value", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_number"], name: "index_sales_on_order_number", unique: true
  end

  create_table "sub_sales", force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "sale_id", null: false
    t.integer "quantity", null: false
    t.integer "subtotal", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_id"], name: "index_sub_sales_on_item_id"
    t.index ["sale_id"], name: "index_sub_sales_on_sale_id"
  end

  add_foreign_key "sub_sales", "items"
  add_foreign_key "sub_sales", "sales"
end
