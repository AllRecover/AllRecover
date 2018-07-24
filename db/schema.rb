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

ActiveRecord::Schema.define(version: 20180724075643) do

  create_table "codecls", force: :cascade do |t|
    t.integer  "clcd"
    t.string   "clcdnm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "codesgs", force: :cascade do |t|
    t.integer  "sggucd"
    t.string   "sggucdnm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "codesis", force: :cascade do |t|
    t.integer  "sidocd"
    t.string   "sidocdnm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "codesubs", force: :cascade do |t|
    t.string   "dgsbjtcd"
    t.string   "dgsbjtcdnm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diseases", force: :cascade do |t|
    t.string   "ykiho"
    t.string   "shwsbjtcdnm"
    t.string   "mf1"
    t.string   "mf2"
    t.string   "mf3"
    t.string   "mf4"
    t.string   "mf5"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "hospevals", force: :cascade do |t|
    t.string   "ykiho"
    t.string   "asmgrd11"
    t.string   "asmgrd12"
    t.string   "asmgrd13"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.string   "ykiho"
    t.string   "yadmnm"
    t.integer  "clcd"
    t.integer  "sidocd"
    t.integer  "sggucd"
    t.string   "addr"
    t.string   "telno"
    t.string   "hospurl"
    t.integer  "drtotcnt"
    t.integer  "gdrcnt"
    t.integer  "intncnt"
    t.integer  "resdntcnt"
    t.integer  "sdrcnt"
    t.float    "xpos"
    t.float    "ypos"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hospsbjs", force: :cascade do |t|
    t.string   "ykiho"
    t.integer  "dg01"
    t.integer  "dg02"
    t.integer  "dg03"
    t.integer  "dg04"
    t.integer  "dg05"
    t.integer  "dg06"
    t.integer  "dg07"
    t.integer  "dg08"
    t.integer  "dg09"
    t.integer  "dg10"
    t.integer  "dg11"
    t.integer  "dg12"
    t.integer  "dg13"
    t.integer  "dg14"
    t.integer  "dg15"
    t.integer  "dg16"
    t.integer  "dg17"
    t.integer  "dg18"
    t.integer  "dg19"
    t.integer  "dg20"
    t.integer  "dg21"
    t.integer  "dg22"
    t.integer  "dg23"
    t.integer  "dg24"
    t.integer  "dg25"
    t.integer  "dg26"
    t.integer  "dg50"
    t.integer  "dg51"
    t.integer  "dg52"
    t.integer  "dg53"
    t.integer  "dg54"
    t.integer  "dg55"
    t.integer  "dg56"
    t.integer  "dg57"
    t.integer  "dg58"
    t.integer  "dg59"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id"

  create_table "nonconditions", force: :cascade do |t|
    t.string   "mainclass"
    t.string   "middleclass"
    t.string   "hospname"
    t.string   "ykiho"
    t.integer  "price"
    t.float    "hostday"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "dist",       default: 5
    t.integer  "price",      default: 5
    t.integer  "grade",      default: 5
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "preferences", ["user_id"], name: "index_preferences_on_user_id"

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "hospital_id"
    t.text     "title"
    t.text     "comment"
    t.integer  "like",        default: 0
    t.integer  "star"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "reviews", ["hospital_id"], name: "index_reviews_on_hospital_id"
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "profile_img"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
