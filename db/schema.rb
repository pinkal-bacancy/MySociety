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

ActiveRecord::Schema.define(version: 20180221120505) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "complaints", force: :cascade do |t|
    t.string "content"
    t.integer "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_complaints_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.date "event_date"
    t.string "event_title"
    t.string "event_description"
    t.bigint "society_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["society_id"], name: "index_events_on_society_id"
  end

  create_table "maintainances", force: :cascade do |t|
    t.string "month"
    t.integer "amount"
    t.date "due_date"
    t.bigint "society_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["society_id"], name: "index_maintainances_on_society_id"
  end

  create_table "messages", force: :cascade do |t|
    t.date "date"
    t.string "message_content"
    t.string "message_to"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "message_from"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["name"], name: "index_roles_on_name"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id"
  end

  create_table "societies", force: :cascade do |t|
    t.string "society_name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "contry"
    t.string "street_name"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.integer "maintainance_status"
    t.bigint "user_id"
    t.bigint "maintainance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["maintainance_id"], name: "index_statuses_on_maintainance_id"
    t.index ["user_id"], name: "index_statuses_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.date "dob"
    t.string "gender"
    t.string "contact_no"
    t.boolean "commity_member"
    t.bigint "society_id"
    t.string "image"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["society_id"], name: "index_users_on_society_id"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "complaints", "users"
  add_foreign_key "events", "societies"
  add_foreign_key "maintainances", "societies"
  add_foreign_key "messages", "users"
  add_foreign_key "statuses", "maintainances"
  add_foreign_key "statuses", "users"
  add_foreign_key "users", "societies"
end
