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

ActiveRecord::Schema.define(version: 20150519045300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "user_id"
    t.date     "date"
    t.string   "place"
    t.time     "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "status"
  end

  add_index "appointments", ["client_id"], name: "index_appointments_on_client_id", using: :btree
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "paternal_lastname"
    t.string   "maternal_lastname"
    t.string   "spouse"
    t.date     "birthdate"
    t.string   "mail"
    t.text     "notes"
    t.integer  "current_salesman_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "marital_status"
    t.boolean  "gender"
  end

  create_table "dossiers", force: :cascade do |t|
    t.integer  "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "dossiers", ["client_id"], name: "index_dossiers_on_client_id", using: :btree

  create_table "employment_records", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "extension"
    t.integer  "zip_code"
    t.string   "position"
    t.string   "email"
    t.integer  "seniority"
    t.decimal  "income"
    t.string   "type"
    t.integer  "dossier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "employment_records", ["dossier_id"], name: "index_employment_records_on_dossier_id", using: :btree

  create_table "interactions", force: :cascade do |t|
    t.string   "kind"
    t.date     "date"
    t.time     "time"
    t.integer  "mood"
    t.integer  "interest"
    t.integer  "user_id"
    t.integer  "client_id"
    t.text     "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "interactions", ["client_id"], name: "index_interactions_on_client_id", using: :btree
  add_index "interactions", ["user_id"], name: "index_interactions_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "phone_number"
    t.string   "body"
    t.date     "to_date"
    t.time     "to_time"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "sended",       default: false
  end

  create_table "phones", force: :cascade do |t|
    t.string   "number"
    t.string   "kind"
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

  add_foreign_key "appointments", "clients"
  add_foreign_key "appointments", "users"
  add_foreign_key "dossiers", "clients"
  add_foreign_key "employment_records", "dossiers"
  add_foreign_key "interactions", "clients"
  add_foreign_key "interactions", "users"
  add_foreign_key "phones", "clients"
end
