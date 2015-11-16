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

ActiveRecord::Schema.define(version: 20151116170044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advisors", force: :cascade do |t|
    t.string   "firstname",           null: false
    t.string   "lastname",            null: false
    t.string   "email",               null: false
    t.string   "password_digest",     null: false
    t.string   "current_title"
    t.string   "job_description"
    t.string   "charity"
    t.string   "location"
    t.string   "alternative_email"
    t.string   "company"
    t.string   "years_of_experience"
    t.string   "other_companies"
    t.string   "education"
    t.string   "certifications"
    t.string   "interesting_facts"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "advisor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "potential_appointments", force: :cascade do |t|
    t.integer  "advisor_id",                     null: false
    t.integer  "cart_id"
    t.time     "start_time",                     null: false
    t.time     "end_time",                       null: false
    t.date     "date",                           null: false
    t.boolean  "booked_status?", default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "email",                               null: false
    t.string   "password_digest",                     null: false
    t.boolean  "student",             default: false
    t.string   "school"
    t.string   "program"
    t.integer  "graduation_date"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end
