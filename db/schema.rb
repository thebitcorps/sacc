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

ActiveRecord::Schema.define(version: 20150717170633) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "user_id"
    t.date     "date"
    t.string   "place"
    t.time     "time"
    t.text     "notes"
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
    t.integer  "zipcode"
    t.integer  "current_salesman_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "marital_status"
    t.boolean  "gender"
    t.boolean  "spouse_works"
    t.string   "credit_type"
    t.string   "fiscal_entity"
    t.integer  "interactions_count",     default: 0
    t.integer  "appointments_count",     default: 0
    t.string   "fullname",                           null: false
    t.string   "salutation"
    t.string   "current_place"
    t.string   "address"
    t.string   "division"
    t.string   "town"
    t.decimal  "total_income"
    t.date     "spouse_birthdate"
    t.string   "pathway"
    t.string   "sales_channel"
    t.string   "status"
    t.boolean  "qualifies"
    t.integer  "offsprings"
    t.integer  "dependents"
    t.string   "which_one_motherfucker"
    t.integer  "house_id"
  end

  add_index "clients", ["created_at"], name: "index_clients_on_created_at", using: :btree
  add_index "clients", ["fullname"], name: "index_clients_on_fullname", using: :btree
  add_index "clients", ["house_id"], name: "index_clients_on_house_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.string   "title"
    t.string   "attatchment"
    t.boolean  "original"
    t.integer  "dossier_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "check",       default: false
  end

  add_index "documents", ["dossier_id"], name: "index_documents_on_dossier_id", using: :btree

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

  create_table "houses", force: :cascade do |t|
    t.string   "block"
    t.integer  "interior"
    t.string   "prototype"
    t.decimal  "land_size"
    t.decimal  "common_area"
    t.decimal  "undivided"
    t.decimal  "selling_area"
    t.decimal  "lot_type"
    t.decimal  "land_oversize"
    t.decimal  "proposed_price"
    t.decimal  "corner"
    t.decimal  "sale_price_compound"
    t.integer  "stage"
    t.integer  "production"
    t.string   "status",              default: "available"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "interactions", force: :cascade do |t|
    t.string   "kind"
    t.date     "date"
    t.time     "time"
    t.integer  "mood"
    t.integer  "interest"
    t.integer  "user_id"
    t.integer  "client_id"
    t.text     "notes"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "completed",  default: false
    t.integer  "position",   default: 0
  end

  add_index "interactions", ["client_id"], name: "index_interactions_on_client_id", using: :btree
  add_index "interactions", ["created_at"], name: "index_interactions_on_created_at", using: :btree
  add_index "interactions", ["user_id"], name: "index_interactions_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "phone_number"
    t.string   "body"
    t.date     "to_date"
    t.time     "to_time"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "sent",         default: false
  end

  create_table "negociations", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "house_id"
    t.integer  "authorized_by"
    t.decimal  "final_price"
    t.integer  "months"
    t.date     "due"
    t.date     "signature_date"
    t.string   "witness1"
    t.string   "witness2"
    t.boolean  "done"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "negociations", ["authorized_by"], name: "index_negociations_on_authorized_by", using: :btree
  add_index "negociations", ["client_id"], name: "index_negociations_on_client_id", using: :btree
  add_index "negociations", ["house_id"], name: "index_negociations_on_house_id", using: :btree

  create_table "phones", force: :cascade do |t|
    t.string   "number"
    t.string   "kind"
    t.time     "available_from"
    t.time     "available_to"
    t.integer  "client_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "is_main",        default: false
  end

  add_index "phones", ["client_id"], name: "index_phones_on_client_id", using: :btree

  create_table "royce_connector", force: :cascade do |t|
    t.integer  "roleable_id",   null: false
    t.string   "roleable_type", null: false
    t.integer  "role_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "royce_connector", ["role_id"], name: "index_royce_connector_on_role_id", using: :btree
  add_index "royce_connector", ["roleable_id", "roleable_type"], name: "index_royce_connector_on_roleable_id_and_roleable_type", using: :btree

  create_table "royce_role", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "royce_role", ["name"], name: "index_royce_role_on_name", using: :btree

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
  add_foreign_key "clients", "houses"
  add_foreign_key "documents", "dossiers"
  add_foreign_key "dossiers", "clients"
  add_foreign_key "employment_records", "dossiers"
  add_foreign_key "interactions", "clients"
  add_foreign_key "interactions", "users"
  add_foreign_key "negociations", "clients"
  add_foreign_key "negociations", "houses"
  add_foreign_key "phones", "clients"
end
