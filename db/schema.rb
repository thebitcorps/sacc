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

ActiveRecord::Schema.define(version: 20150511004624) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "paternal_name"
    t.string   "maternal_name"
    t.string   "curp"
    t.string   "imss"
    t.string   "spouse"
    t.date     "birthdate"
    t.string   "mail"
    t.decimal  "income"
    t.text     "notes"
    t.string   "workplace"
    t.integer  "current_salesman_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "marital_status"
    t.boolean  "gender"
    t.integer  "visits_count",        default: 0
  end

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

  create_table "visits", force: :cascade do |t|
    t.integer  "client_id"
    t.text     "notes"
    t.integer  "mood"
    t.integer  "interest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "visits", ["client_id"], name: "index_visits_on_client_id", using: :btree

  add_foreign_key "visits", "clients"
end
