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

ActiveRecord::Schema.define(version: 20160111231524) do

  create_table "http_errors", force: :cascade do |t|
    t.text     "request",       limit: 65535
    t.text     "response",      limit: 65535
    t.text     "url",           limit: 65535
    t.string   "method",        limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.text     "response_code", limit: 65535
  end

  create_table "mappings", force: :cascade do |t|
    t.string   "workfront_id", limit: 255
    t.integer  "parent_id",    limit: 4
    t.string   "jira_id",      limit: 255
    t.string   "object_type",  limit: 255
    t.text     "jira_data",    limit: 65535
    t.text     "wf_data",      limit: 65535
    t.boolean  "active",       limit: 1,     default: true
    t.boolean  "error_state",  limit: 1,     default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "tokens", force: :cascade do |t|
    t.string   "provider",   limit: 255
    t.string   "token",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_mappings", force: :cascade do |t|
    t.string   "workfront_id", limit: 255
    t.string   "jira_id",      limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

end
