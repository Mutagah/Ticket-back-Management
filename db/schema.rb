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

ActiveRecord::Schema[7.0].define(version: 2022_11_16_193235) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abouts", force: :cascade do |t|
    t.string "about_img"
    t.text "about_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.string "banner_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "communities", force: :cascade do |t|
    t.text "community_description"
    t.string "community_img"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "event_start_date"
    t.datetime "event_end_date"
    t.string "ticket_format"
    t.datetime "early_booking_end_date"
    t.integer "early_booking_price_regular"
    t.integer "early_booking_price_vip"
    t.string "location"
    t.integer "regular_price"
    t.integer "vip_price"
    t.integer "vip_no_of_tickets"
    t.integer "regular_no_of_tickets"
    t.text "description"
    t.string "banner_img"
    t.string "image_url1"
    t.string "image_url2"
    t.bigint "user_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "home_banners", force: :cascade do |t|
    t.string "title"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "login_slides", force: :cascade do |t|
    t.string "title"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "amount"
    t.string "phone_number"
    t.string "response"
    t.integer "vip_tickets"
    t.integer "regular_tickets"
    t.integer "event_id"
    t.string "ticket_format"
    t.string "CheckoutRequestID"
    t.string "MerchantRequestID"
    t.boolean "state", default: false
    t.string "code"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_payments_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "ticket_no"
    t.integer "number_of_vip_tickets"
    t.integer "number_of_regular_tickets"
    t.bigint "user_id"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_tickets_on_event_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.string "callback"
    t.string "CheckoutRequestID"
    t.string "MerchantRequestID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_attendeds", force: :cascade do |t|
    t.integer "vip_tickets"
    t.integer "regular_tickets"
    t.float "total_amount"
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_user_attendeds_on_event_id"
    t.index ["user_id"], name: "index_user_attendeds_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "full_name"
    t.string "email"
    t.integer "age"
    t.string "gender"
    t.string "mobile_no"
    t.string "bio"
    t.string "image_upload"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "categories"
  add_foreign_key "events", "users"
  add_foreign_key "payments", "users"
  add_foreign_key "tickets", "events"
  add_foreign_key "tickets", "users"
  add_foreign_key "user_attendeds", "events"
  add_foreign_key "user_attendeds", "users"
  add_foreign_key "user_profiles", "users"
end
