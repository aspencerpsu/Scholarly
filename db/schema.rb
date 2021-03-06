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

ActiveRecord::Schema.define(version: 20160412181127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string   "industry"
    t.string   "title"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.string   "email"
  end

  create_table "scholarships", force: :cascade do |t|
    t.string   "name"
    t.string   "scholarship"
    t.string   "value"
    t.datetime "deadline"
    t.decimal  "gpa",         default: 0.0
    t.integer  "provider_id"
    t.string   "directlink"
  end

  add_index "scholarships", ["provider_id"], name: "index_scholarships_on_provider_id", using: :btree

  create_table "scholarships_students", force: :cascade do |t|
    t.integer "scholarship_id", null: false
    t.integer "student_id",     null: false
  end

  add_index "scholarships_students", ["scholarship_id", "student_id"], name: "index_scholarships_students_on_scholarship_id_and_student_id", using: :btree
  add_index "scholarships_students", ["student_id", "scholarship_id"], name: "index_scholarships_students_on_student_id_and_scholarship_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "gender",                    default: "1"
    t.string   "location"
    t.string   "identity"
    t.string   "address1"
    t.string   "address2"
    t.integer  "zip"
    t.integer  "cell",            limit: 8
    t.integer  "home",            limit: 8
    t.string   "activities"
    t.decimal  "gpa"
    t.string   "majors"
    t.string   "college"
    t.string   "militaryservice"
  end

  add_foreign_key "scholarships", "providers"
end
