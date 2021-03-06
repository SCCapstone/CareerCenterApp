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

ActiveRecord::Schema.define(version: 20140426175754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conferences", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.text     "description"
    t.string   "last_edit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "map"
  end

  create_table "employers", force: true do |t|
    t.string   "name"
    t.text     "website"
    t.text     "description"
    t.text     "majors"
    t.string   "email"
    t.text     "positions"
    t.text     "tips"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_edit"
    t.integer  "table_id"
    t.integer  "conference_id"
    t.string   "location"
    t.string   "logo"
    t.string   "table_s"
  end

  create_table "messages", force: true do |t|
    t.integer  "to"
    t.integer  "from"
    t.string   "from_role"
    t.boolean  "read"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "expiration"
    t.integer  "lifetime"
    t.datetime "display_till"
  end

  create_table "tables", force: true do |t|
    t.integer  "num"
    t.integer  "conference_id"
    t.integer  "employer_id"
    t.string   "last_edit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "role"
    t.text     "favorites",      array: true
    t.string   "source"
    t.text     "token"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identifier_url"
  end

  add_index "users", ["identifier_url"], name: "index_users_on_identifier_url", unique: true, using: :btree

end
