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

ActiveRecord::Schema.define(version: 2018_12_03_121841) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accountant_industries", force: :cascade do |t|
    t.bigint "accountant_id"
    t.bigint "industry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accountant_id"], name: "index_accountant_industries_on_accountant_id"
    t.index ["industry_id"], name: "index_accountant_industries_on_industry_id"
  end

  create_table "accountant_services", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "accountant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accountant_id"], name: "index_accountant_services_on_accountant_id"
    t.index ["service_id"], name: "index_accountant_services_on_service_id"
  end

  create_table "accountants", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "website"
    t.string "qualification"
    t.text "bio"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "industries_string"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "enquiries", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "is_local"
    t.boolean "network", default: false, null: false
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "company_name"
    t.string "company_reg"
    t.string "industry_string"
    t.string "size"
    t.string "location"
    t.index ["user_id"], name: "index_enquiries_on_user_id"
  end

  create_table "enquiry_services", force: :cascade do |t|
    t.bigint "service_id"
    t.bigint "enquiry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enquiry_id"], name: "index_enquiry_services_on_enquiry_id"
    t.index ["service_id"], name: "index_enquiry_services_on_service_id"
  end

  create_table "industries", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.boolean "successful"
    t.boolean "invite"
    t.text "message"
    t.bigint "enquiry_id"
    t.bigint "accountant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["accountant_id"], name: "index_quotes_on_accountant_id"
    t.index ["enquiry_id"], name: "index_quotes_on_enquiry_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "company_industry"
    t.string "company_name"
    t.string "company_size"
    t.string "company_location"
    t.boolean "admin", default: false, null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "accountant_industries", "accountants"
  add_foreign_key "accountant_industries", "industries"
  add_foreign_key "accountant_services", "accountants"
  add_foreign_key "accountant_services", "services"
  add_foreign_key "enquiries", "users"
  add_foreign_key "enquiry_services", "enquiries"
  add_foreign_key "enquiry_services", "services"
  add_foreign_key "quotes", "accountants"
  add_foreign_key "quotes", "enquiries"
end
