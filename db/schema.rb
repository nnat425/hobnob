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

ActiveRecord::Schema.define(version: 20151216203949) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "username",        null: false
    t.string "password_digest", null: false
  end

  create_table "advisors", force: :cascade do |t|
    t.string   "firstname",              null: false
    t.string   "lastname",               null: false
    t.string   "email",                  null: false
    t.string   "password_digest",        null: false
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
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "student_price"
    t.integer  "regular_price"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  create_table "advisors_categories", force: :cascade do |t|
    t.integer  "advisor_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "advisors_categories", ["advisor_id"], name: "index_advisors_categories_on_advisor_id", using: :btree
  add_index "advisors_categories", ["category_id"], name: "index_advisors_categories_on_category_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id",                      null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "checked_out?", default: false
    t.time     "purchased_at"
  end

  create_table "carts_potential_appointments", force: :cascade do |t|
    t.integer "potential_appointment_id"
    t.integer "cart_id"
  end

  add_index "carts_potential_appointments", ["cart_id"], name: "index_carts_potential_appointments_on_cart_id", using: :btree
  add_index "carts_potential_appointments", ["potential_appointment_id"], name: "index_carts_potential_appointments_on_potential_appointment_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "body",                       null: false
    t.string   "subtext"
    t.boolean  "charity",    default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "order_transactions", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "order_transactions", ["order_id"], name: "index_order_transactions_on_order_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.integer "cart_id"
    t.string  "ip_address"
    t.string  "first_name"
    t.string  "last_name"
    t.string  "card_type"
    t.date    "card_expires_on"
  end

  create_table "potential_appointments", force: :cascade do |t|
    t.string   "title",                          null: false
    t.integer  "advisor_id",                     null: false
    t.datetime "start_time",                     null: false
    t.datetime "end_time",                       null: false
    t.boolean  "booked_status?", default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                             null: false
    t.string   "last_name",                              null: false
    t.string   "email",                                  null: false
    t.string   "password_digest",                        null: false
    t.boolean  "student",                default: false
    t.string   "school"
    t.string   "program"
    t.integer  "graduation_date"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
  end

  add_foreign_key "advisors_categories", "advisors"
  add_foreign_key "advisors_categories", "categories"
  add_foreign_key "carts_potential_appointments", "carts"
  add_foreign_key "carts_potential_appointments", "potential_appointments"
  add_foreign_key "order_transactions", "orders"
end
