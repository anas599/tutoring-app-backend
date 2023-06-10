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

ActiveRecord::Schema[7.0].define(version: 2023_06_10_220631) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_subjects", force: :cascade do |t|
    t.string "subject"
    t.string "description"
    t.decimal "price"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "tutorName"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "date"
    t.string "city"
    t.bigint "user_id", null: false
    t.bigint "class_subject_id", null: false
    t.datetime "start", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["class_subject_id"], name: "index_reservations_on_class_subject_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "reservations", "class_subjects"
  add_foreign_key "reservations", "users"
end
