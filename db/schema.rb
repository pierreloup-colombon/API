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

ActiveRecord::Schema.define(version: 20150301215821) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "activities", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "startAt"
    t.datetime "endDate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "addresses", force: true do |t|
    t.string   "street"
    t.string   "zip"
    t.string   "string"
    t.string   "city"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "baskets", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",     default: 0
    t.integer  "shop_id"
    t.integer  "vendor_id",                null: false
    t.integer  "buyer_id"
    t.float    "total",      default: 0.0
    t.text     "products"
  end

  add_index "baskets", ["shop_id"], name: "index_baskets_on_shop_id", using: :btree

  create_table "events", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",        limit: 512
    t.text     "description"
    t.datetime "date"
    t.integer  "status",                  default: 0
  end

  create_table "product_categories", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_id"
    t.string   "name"
    t.text     "description"
    t.float    "price",       default: 0.0
    t.integer  "quantity",    default: 0
    t.integer  "status",      default: 0
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shops", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.string   "name"
    t.text     "description"
    t.integer  "status",      default: 0
    t.integer  "owner_id"
  end

  add_index "shops", ["owner_id"], name: "index_shops_on_owner_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "provider",                            null: false
    t.string   "uid",                    default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "nickname"
    t.string   "image"
    t.string   "email"
    t.text     "tokens"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.integer  "pin_code"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree

  create_table "wallets", force: true do |t|
    t.integer  "user_id"
    t.float    "amount",     default: 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wallets", ["user_id"], name: "index_wallets_on_user_id", using: :btree

  create_table "wristbands", id: :uuid, default: "uuid_generate_v4()", force: true do |t|
    t.integer  "money_source", default: 0
    t.integer  "status",       default: 0
    t.integer  "amount",       default: 0
    t.integer  "currency",     default: 0
    t.integer  "wallet_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "wristbands", ["wallet_id"], name: "index_wristbands_on_wallet_id", using: :btree

end
