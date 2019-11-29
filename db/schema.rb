# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_29_123538) do

  create_table "rooms", force: :cascade do |t|
    t.boolean "using"
    t.integer "student_id"
    t.integer "teacher_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "begin_time"
    t.datetime "end_time"
    t.string "campus"
    t.string "office"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password"
    t.boolean "student"
    t.boolean "teacher"
    t.boolean "admin"
    t.integer "school_id"
    t.string "password_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["school_id"], name: "index_users_on_school_id", unique: true
  end

end
