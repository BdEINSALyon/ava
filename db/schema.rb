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

ActiveRecord::Schema.define(version: 20160614215502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.string   "first_name"
    t.integer  "study_year_id"
    t.integer  "department_id"
    t.integer  "student_card"
    t.date     "birthday"
    t.string   "email"
    t.string   "phone"
    t.string   "gender"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.decimal  "price"
    t.boolean  "active"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "memberships_exclusions", force: :cascade do |t|
    t.integer "membership_id"
    t.integer "excluded_membership_id"
  end

  add_index "memberships_exclusions", ["excluded_membership_id"], name: "index_memberships_exclusions_on_excluded_membership_id", using: :btree
  add_index "memberships_exclusions", ["membership_id"], name: "index_memberships_exclusions_on_membership_id", using: :btree

  create_table "memberships_subscriptions", id: false, force: :cascade do |t|
    t.integer "subscription_id", null: false
    t.integer "membership_id",   null: false
  end

  add_index "memberships_subscriptions", ["membership_id", "subscription_id"], name: "ms_index", using: :btree
  add_index "memberships_subscriptions", ["membership_id"], name: "index_memberships_subscriptions_on_membership_id", using: :btree
  add_index "memberships_subscriptions", ["subscription_id", "membership_id"], name: "sm_index", using: :btree
  add_index "memberships_subscriptions", ["subscription_id"], name: "index_memberships_subscriptions_on_subscription_id", using: :btree

  create_table "study_years", force: :cascade do |t|
    t.integer  "year"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "member_id"
    t.string   "method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
