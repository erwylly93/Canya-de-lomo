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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140423164712) do

  create_table "brands", :force => true do |t|
    t.string   "name",                    :null => false
    t.string   "phone",      :limit => 9
    t.string   "city"
    t.string   "province"
    t.string   "street"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "cart_items", :force => true do |t|
    t.integer  "product_id"
    t.integer  "cart_id"
    t.float    "price"
    t.integer  "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "carts", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name",                     :null => false
    t.integer  "brand_id",                 :null => false
    t.string   "type"
    t.text     "description"
    t.string   "origin"
    t.float    "price"
    t.float    "weight"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "cover_image_file_name"
    t.string   "cover_image_content_type"
    t.integer  "cover_image_file_size"
    t.datetime "cover_image_updated_at"
  end

  add_index "products", ["brand_id"], :name => "fk_products_brands"

  create_table "products_suppliers", :force => true do |t|
    t.integer "supplier_id", :null => false
    t.integer "product_id",  :null => false
  end

  add_index "products_suppliers", ["product_id"], :name => "fk_products_suppliers_products"
  add_index "products_suppliers", ["supplier_id"], :name => "fk_products_suppliers_suppliers"

  create_table "suppliers", :force => true do |t|
    t.string   "name",                    :null => false
    t.string   "street"
    t.string   "city"
    t.string   "province"
    t.string   "phone",      :limit => 9
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

end
