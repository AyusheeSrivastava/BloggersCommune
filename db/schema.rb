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

ActiveRecord::Schema.define(version: 20180704180742) do

  create_table "blog_models", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "locked_version"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "comments_models", force: :cascade do |t|
    t.string   "description"
    t.integer  "blog_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "lock_version"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "user_models", force: :cascade do |t|
    t.string   "firstname"
    t.string   "secondname"
    t.string   "password"
    t.datetime "dob"
    t.string   "email"
    t.string   "phoneNo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "gender"
  end

end
