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

ActiveRecord::Schema.define(version: 20170318075108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
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
    t.string   "name"
    t.string   "mobile_number"
    t.date     "birthdate"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["invitation_token"], name: "index_admins_on_invitation_token", unique: true, using: :btree
  add_index "admins", ["invitations_count"], name: "index_admins_on_invitations_count", using: :btree
  add_index "admins", ["invited_by_id"], name: "index_admins_on_invited_by_id", using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "attendances", force: :cascade do |t|
    t.integer  "session_id"
    t.integer  "student_id"
    t.boolean  "presence",   default: false, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "attendances", ["session_id"], name: "index_attendances_on_session_id", using: :btree
  add_index "attendances", ["student_id"], name: "index_attendances_on_student_id", using: :btree

  create_table "diagnostics", force: :cascade do |t|
    t.string   "type",                   null: false
    t.integer  "student_id",             null: false
    t.integer  "project_id",             null: false
    t.integer  "score",      default: 0, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "diagnostics", ["project_id"], name: "index_diagnostics_on_project_id", using: :btree
  add_index "diagnostics", ["student_id", "project_id"], name: "index_diagnostics_on_student_id_and_project_id", unique: true, using: :btree
  add_index "diagnostics", ["student_id"], name: "index_diagnostics_on_student_id", using: :btree

  create_table "facilitators", force: :cascade do |t|
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
    t.string   "name"
    t.string   "mobile_number"
    t.date     "birthdate"
    t.string   "project"
    t.string   "description"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "facilitators", ["email"], name: "index_facilitators_on_email", unique: true, using: :btree
  add_index "facilitators", ["invitation_token"], name: "index_facilitators_on_invitation_token", unique: true, using: :btree
  add_index "facilitators", ["invitations_count"], name: "index_facilitators_on_invitations_count", using: :btree
  add_index "facilitators", ["invited_by_id"], name: "index_facilitators_on_invited_by_id", using: :btree
  add_index "facilitators", ["reset_password_token"], name: "index_facilitators_on_reset_password_token", unique: true, using: :btree

  create_table "projects", force: :cascade do |t|
    t.integer  "facilitator_id"
    t.string   "name",                       null: false
    t.string   "location",                   null: false
    t.date     "start_on",                   null: false
    t.date     "end_on"
    t.integer  "status",         default: 1, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "projects", ["facilitator_id"], name: "index_projects_on_facilitator_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.integer  "project_id"
    t.date     "date",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sessions", ["project_id"], name: "index_sessions_on_project_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "name",       null: false
    t.string   "class_name", null: false
    t.date     "birthday"
    t.text     "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "students", ["project_id"], name: "index_students_on_project_id", using: :btree

  add_foreign_key "attendances", "sessions"
  add_foreign_key "attendances", "students"
  add_foreign_key "diagnostics", "projects"
  add_foreign_key "diagnostics", "students"
  add_foreign_key "projects", "facilitators"
  add_foreign_key "sessions", "projects"
  add_foreign_key "students", "projects"
end
