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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130114114419) do

  create_table "car_models", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "make_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cars", :force => true do |t|
    t.text     "description",                     :null => false
    t.integer  "price",                           :null => false
    t.integer  "year",                            :null => false
    t.integer  "seats"
    t.integer  "doors"
    t.boolean  "sold",         :default => false
    t.integer  "car_model_id"
    t.integer  "owner_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "mileage"
    t.text     "transmission"
    t.text     "type"
    t.text     "color"
    t.integer  "capacity"
    t.integer  "visited",      :default => 0
  end

  create_table "makes", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "owners", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "email",      :null => false
    t.string   "phone"
    t.string   "mobile",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "password"
    t.string   "password_digest"
    t.integer  "owner_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
