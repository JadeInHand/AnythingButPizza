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

ActiveRecord::Schema.define(version: 20150929232440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.text     "types"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.text     "name"
    t.integer  "servings"
    t.float    "cost"
    t.text     "description"
    t.text     "tags"
    t.text     "image"
    t.boolean  "active"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "shopping_cart_id"
    t.integer  "quantity_purchased", default: 0
    t.integer  "cost"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "seller_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.integer  "total_cost"
    t.integer  "order_number"
    t.integer  "user_id"
    t.boolean  "active"
    t.boolean  "paid",         default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "users", force: :cascade do |t|
    t.text     "name"
    t.text     "email"
    t.text     "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "postcode"
    t.text     "image"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "password_digest"
    t.boolean  "admin"
  end

end
