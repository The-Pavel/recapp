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

ActiveRecord::Schema.define(version: 20190228110613) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string "video"
    t.string "cv"
    t.string "status"
    t.bigint "user_id"
    t.bigint "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cv_id"
    t.integer "videocv_id"
    t.index ["position_id"], name: "index_applications_on_position_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "cvs", force: :cascade do |t|
    t.string "title"
    t.boolean "is_video", default: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "file"
    t.index ["user_id"], name: "index_cvs_on_user_id"
  end

  create_table "employers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "company_name"
    t.string "contact_info"
    t.string "image"
    t.string "employer_website"
    t.text "employer_bio"
    t.string "employer_title"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_employers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employers_on_reset_password_token", unique: true
  end

  create_table "positions", force: :cascade do |t|
    t.string "title", default: "", null: false
    t.string "location", default: "", null: false
    t.integer "min_salary"
    t.integer "max_salary"
    t.string "active_status"
    t.string "occupation_type"
    t.text "responsibilities"
    t.text "requirements"
    t.bigint "employer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employer_id"], name: "index_positions_on_employer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "contact_info"
    t.string "image"
    t.string "cv_array", default: [], array: true
    t.string "video_array", default: [], array: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applications", "positions"
  add_foreign_key "applications", "users"
  add_foreign_key "cvs", "users"
  add_foreign_key "positions", "employers"
end
