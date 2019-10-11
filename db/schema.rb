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

ActiveRecord::Schema.define(version: 2019_10_10_115259) do

  create_table "details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "large_category", null: false
    t.string "medium_category", null: false
    t.string "small_category", null: false
    t.string "size", null: false
    t.string "brand", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand"], name: "index_details_on_brand"
    t.index ["large_category"], name: "index_details_on_large_category"
    t.index ["medium_category"], name: "index_details_on_medium_category"
    t.index ["product_id"], name: "index_details_on_product_id"
    t.index ["size"], name: "index_details_on_size"
    t.index ["small_category"], name: "index_details_on_small_category"
  end

  create_table "images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "img", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_images_on_product_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.text "discription"
    t.string "condition", null: false
    t.string "delivery_charge", null: false
    t.string "origin_area", null: false
    t.integer "days_left_send", null: false
    t.integer "price", null: false
    t.string "status", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["condition"], name: "index_products_on_condition"
    t.index ["delivery_charge"], name: "index_products_on_delivery_charge"
    t.index ["name"], name: "index_products_on_name"
    t.index ["price"], name: "index_products_on_price"
    t.index ["status"], name: "index_products_on_status"
  end

  add_foreign_key "details", "products"
  add_foreign_key "images", "products"
end
