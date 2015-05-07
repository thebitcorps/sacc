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

ActiveRecord::Schema.define(version: 20150507213153) do

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
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "marital_status"
  end

end
