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

ActiveRecord::Schema.define(:version => 20130503012630) do

  create_table "investments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.float    "capital"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "investments", ["property_id"], :name => "index_investments_on_property_id"
  add_index "investments", ["user_id"], :name => "index_investments_on_user_id"

  create_table "properties", :force => true do |t|
    t.string   "country_code"
    t.string   "city"
    t.string   "state"
    t.string   "address"
    t.string   "description"
    t.float    "purchase_value"
    t.float    "irr"
    t.float    "client_irr"
    t.float    "available_value"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "purchases", :force => true do |t|
    t.integer  "user_id"
    t.integer  "property_id"
    t.float    "investment"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "purchases", ["property_id"], :name => "index_purchases_on_property_id"
  add_index "purchases", ["user_id"], :name => "index_purchases_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.float    "account_total"
    t.float    "account_invested"
    t.float    "account_balance"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
