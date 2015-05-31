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

ActiveRecord::Schema.define(version: 20150531141540) do

  create_table "events", force: true do |t|
    t.string   "name"
    t.string   "fullName"
    t.integer  "owner_id"
    t.integer  "location_id"
    t.date     "startDate"
    t.date     "endDate"
    t.text     "description"
    t.text     "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "fullName"
    t.text     "address"
    t.string   "phone"
    t.string   "email"
    t.text     "description"
    t.string   "capacity"
    t.text     "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.string   "fullName"
    t.text     "address"
    t.string   "phone"
    t.string   "email"
    t.text     "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patterns", force: true do |t|
    t.string   "name"
    t.string   "type"
    t.text     "description"
    t.text     "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rules", force: true do |t|
    t.string   "name"
    t.text     "criteria"
    t.text     "description"
    t.text     "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schedules", force: true do |t|
    t.datetime "startDate"
    t.datetime "endDate"
    t.string   "mask"
    t.text     "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.string   "ticketID"
    t.integer  "eventID_id"
    t.integer  "ownerID_id"
    t.datetime "purchaseDate"
    t.datetime "expirationDate"
    t.decimal  "price"
    t.string   "discount"
    t.string   "seat"
    t.text     "description"
    t.text     "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["eventID_id"], name: "index_tickets_on_eventID_id"
  add_index "tickets", ["ownerID_id"], name: "index_tickets_on_ownerID_id"

  create_table "users", force: true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "phone"
    t.text     "address"
    t.integer  "organization_id"
    t.text     "tags"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["organization_id"], name: "index_users_on_organization_id"

end
