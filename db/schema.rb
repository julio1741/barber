# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_04_06_144431) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "block_times", force: :cascade do |t|
    t.time "start"
    t.time "end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "branches", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "image_url"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "uri_web"
    t.string "nid"
    t.string "logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "phone"
    t.datetime "day"
    t.string "rut"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.bigint "work_day_id", null: false
    t.bigint "block_time_id", null: false
    t.bigint "worker_id", null: false
    t.bigint "service_id", null: false
    t.bigint "organization_id", null: false
    t.index ["block_time_id"], name: "index_reservations_on_block_time_id"
    t.index ["organization_id"], name: "index_reservations_on_organization_id"
    t.index ["service_id"], name: "index_reservations_on_service_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
    t.index ["work_day_id"], name: "index_reservations_on_work_day_id"
    t.index ["worker_id"], name: "index_reservations_on_worker_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id", null: false
    t.string "photo_url"
    t.index ["organization_id"], name: "index_services_on_organization_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "phone"
    t.bigint "organization_id", null: false
    t.index ["organization_id"], name: "index_users_on_organization_id"
  end

  create_table "work_days", force: :cascade do |t|
    t.string "name"
    t.integer "day_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workers", force: :cascade do |t|
    t.string "name"
    t.string "instagram"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "phone"
    t.bigint "organization_id", null: false
    t.string "photo_url"
    t.index ["organization_id"], name: "index_workers_on_organization_id"
  end

  create_table "working_days", force: :cascade do |t|
    t.bigint "worker_id", null: false
    t.bigint "work_day_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_day_id"], name: "index_working_days_on_work_day_id"
    t.index ["worker_id"], name: "index_working_days_on_worker_id"
  end

  create_table "working_hours", force: :cascade do |t|
    t.bigint "worker_id", null: false
    t.bigint "block_time_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_time_id"], name: "index_working_hours_on_block_time_id"
    t.index ["worker_id"], name: "index_working_hours_on_worker_id"
  end

  add_foreign_key "reservations", "block_times"
  add_foreign_key "reservations", "organizations"
  add_foreign_key "reservations", "services"
  add_foreign_key "reservations", "users"
  add_foreign_key "reservations", "work_days"
  add_foreign_key "reservations", "workers"
  add_foreign_key "services", "organizations"
  add_foreign_key "users", "organizations"
  add_foreign_key "workers", "organizations"
  add_foreign_key "working_days", "work_days"
  add_foreign_key "working_days", "workers"
  add_foreign_key "working_hours", "block_times"
  add_foreign_key "working_hours", "workers"
end
