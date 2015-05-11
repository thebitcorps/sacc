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

ActiveRecord::Schema.define(version: 20150511204351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "external_number"
    t.string   "internal_number"
    t.string   "colony"
    t.integer  "zip_code"
    t.integer  "client_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "addresses", ["client_id"], name: "index_addresses_on_client_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "paternal_lastname"
    t.string   "maternal_lastname"
    t.string   "curp"
    t.string   "imss"
    t.string   "spouse"
    t.date     "birthdate"
    t.string   "mail"
    t.decimal  "income"
    t.text     "notes"
    t.string   "workplace"
    t.integer  "current_salesman_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "marital_status"
    t.boolean  "gender"
  end

  create_table "phones", force: :cascade do |t|
    t.string   "number"
    t.string   "phone_type"
    t.time     "available_from"
    t.time     "available_to"
    t.integer  "client_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "phones", ["client_id"], name: "index_phones_on_client_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "paternal_lastname"
    t.string   "maternal_lastname"
    t.string   "cellphone"
    t.boolean  "gender"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "addresses", "clients"
  add_foreign_key "phones", "clients"
end
