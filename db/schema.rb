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

ActiveRecord::Schema.define(version: 2020_07_03_061443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorite_periods", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "period_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["period_id"], name: "index_favorite_periods_on_period_id"
    t.index ["user_id"], name: "index_favorite_periods_on_user_id"
  end

  create_table "favorite_plans", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "plan_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["plan_id"], name: "index_favorite_plans_on_plan_id"
    t.index ["user_id"], name: "index_favorite_plans_on_user_id"
  end

  create_table "favorite_workouts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "workout_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_favorite_workouts_on_user_id"
    t.index ["workout_id"], name: "index_favorite_workouts_on_workout_id"
  end

  create_table "periods", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.text "description"
    t.integer "days"
    t.boolean "shared"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_periods_on_user_id"
  end

  create_table "periods_workouts", force: :cascade do |t|
    t.bigint "workout_id", null: false
    t.bigint "period_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["period_id"], name: "index_periods_workouts_on_period_id"
    t.index ["workout_id"], name: "index_periods_workouts_on_workout_id"
  end

  create_table "plans", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "shared"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "plans_timeperiods", force: :cascade do |t|
    t.bigint "period_id", null: false
    t.bigint "plan_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["period_id"], name: "index_plans_timeperiods_on_period_id"
    t.index ["plan_id"], name: "index_plans_timeperiods_on_plan_id"
  end

  create_table "ticks", force: :cascade do |t|
    t.bigint "user_id"
    t.date "date"
    t.string "name"
    t.string "climbtype"
    t.integer "grade"
    t.string "style"
    t.string "crag"
    t.text "comment"
    t.text "beta"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_ticks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "email_confirmed", default: false
    t.string "confirm_token"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "title"
    t.string "category"
    t.text "description"
    t.boolean "shared"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_workouts_on_user_id"
  end

  add_foreign_key "favorite_periods", "periods"
  add_foreign_key "favorite_periods", "users"
  add_foreign_key "favorite_plans", "plans"
  add_foreign_key "favorite_plans", "users"
  add_foreign_key "favorite_workouts", "users"
  add_foreign_key "favorite_workouts", "workouts"
  add_foreign_key "periods", "users"
  add_foreign_key "periods_workouts", "periods"
  add_foreign_key "periods_workouts", "workouts"
  add_foreign_key "plans", "users"
  add_foreign_key "plans_timeperiods", "periods"
  add_foreign_key "plans_timeperiods", "plans"
  add_foreign_key "workouts", "users"
end
