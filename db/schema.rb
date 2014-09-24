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

ActiveRecord::Schema.define(version: 20140924160124) do

  create_table "addresses", force: true do |t|
    t.string  "city"
    t.string  "state"
    t.string  "zip"
    t.string  "street"
    t.boolean "billing"
    t.boolean "shipping"
  end

  create_table "cart_items", force: true do |t|
    t.integer  "cart_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorizations", force: true do |t|
    t.integer  "item_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["category_id"], name: "index_categorizations_on_category_id"
  add_index "categorizations", ["item_id"], name: "index_categorizations_on_item_id"

  create_table "featured_suppliers", force: true do |t|
    t.integer "supplier_id"
  end

  create_table "items", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "inventory"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean  "retire",               default: false
    t.integer  "supplier_id"
    t.string   "size"
    t.integer  "price"
  end

  create_table "order_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sub_order_id"
    t.integer  "quantity"
    t.integer  "price"
  end

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.integer  "order_total"
    t.string   "order_type"
    t.string   "order_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "delivery_address_id"
    t.integer  "billing_address_id"
  end

  create_table "pending_admins", force: true do |t|
    t.integer "supplier_id"
    t.integer "user_id"
  end

  create_table "sub_orders", force: true do |t|
    t.integer  "order_id"
    t.integer  "supplier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider_name"
    t.string   "provider_email"
    t.string   "status"
    t.string   "order_type"
    t.integer  "delivery_address_id"
    t.integer  "billing_address_id"
  end

  create_table "suppliers", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean  "enabled",              default: false
  end

  create_table "suppliers_users", force: true do |t|
    t.integer "user_id"
    t.integer "supplier_id"
    t.string  "role"
  end

  create_table "user_addresses", force: true do |t|
    t.integer "user_id"
    t.integer "address_id"
  end

  create_table "users", force: true do |t|
    t.string   "full_name"
    t.string   "email"
    t.string   "display_name"
    t.string   "role",                 default: "customer"
    t.string   "encrypted_password"
    t.string   "password_digest"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.string   "phone_number"
    t.boolean  "send_texts"
    t.string   "password_reset_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
