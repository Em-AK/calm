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

ActiveRecord::Schema.define(version: 20150131223127) do

  create_table "mediators", force: :cascade do |t|
    t.string   "name"
    t.string   "firstname"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organisation_id"
  end

  add_index "mediators", ["email"], name: "index_mediators_on_email", unique: true
  add_index "mediators", ["organisation_id"], name: "index_mediators_on_organisation_id"
  add_index "mediators", ["reset_password_token"], name: "index_mediators_on_reset_password_token", unique: true

  create_table "organisations", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refugees", force: :cascade do |t|
    t.string   "firstname"
    t.string   "name"
    t.date     "birthday"
    t.string   "nationality"
    t.text     "description"
    t.integer  "mediator_id"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "confirmed",              default: false
  end

  add_index "refugees", ["email"], name: "index_refugees_on_email", unique: true
  add_index "refugees", ["mediator_id"], name: "index_refugees_on_mediator_id"
  add_index "refugees", ["reset_password_token"], name: "index_refugees_on_reset_password_token", unique: true

end
