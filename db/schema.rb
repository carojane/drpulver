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

ActiveRecord::Schema.define(version: 20141014181301) do

  create_table "assignments", force: true do |t|
    t.text     "body",       null: false
    t.string   "title",      null: false
    t.date     "due_date",   null: false
    t.integer  "course_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.string   "name",         null: false
    t.string   "number",       null: false
    t.string   "meeting_time"
    t.text     "description"
    t.text     "syllabus"
    t.date     "start_date",   null: false
    t.date     "end_date",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
  end

  create_table "enrollments", force: true do |t|
    t.integer  "user_id",    null: false
    t.integer  "course_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enrollments", ["user_id", "course_id"], name: "index_enrollments_on_user_id_and_course_id", unique: true

  create_table "ribbits", force: true do |t|
    t.text     "content",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: true do |t|
    t.date     "date_of_birth"
    t.text     "bio"
    t.integer  "user_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "students", ["user_id"], name: "index_students_on_user_id", unique: true

  create_table "submissions", force: true do |t|
    t.integer  "user_id",       null: false
    t.integer  "assignment_id", null: false
    t.text     "body",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "submissions", ["user_id", "assignment_id"], name: "index_submissions_on_user_id_and_assignment_id", unique: true

  create_table "users", force: true do |t|
    t.string   "username",                                  null: false
    t.string   "name"
    t.string   "avatar_url"
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile"
    t.string   "role",                   default: "member", null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

end
