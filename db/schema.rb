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

ActiveRecord::Schema.define(version: 20171106104122) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name_category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.bigint "stock_id"
    t.integer "quantity_ordered"
    t.bigint "shoppinglist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shoppinglist_id"], name: "index_items_on_shoppinglist_id"
    t.index ["stock_id"], name: "index_items_on_stock_id"
  end

  create_table "shoppinglists", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "paid_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shoppinglists_on_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name_item"
    t.integer "barcode"
    t.decimal "price"
    t.integer "quantity"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_stocks_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "items", "shoppinglists"
  add_foreign_key "items", "stocks"
  add_foreign_key "shoppinglists", "users"
  add_foreign_key "stocks", "categories"
end
