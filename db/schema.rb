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

ActiveRecord::Schema.define(:version => 20121210220347) do

  create_table "bandcamp_payments", :force => true do |t|
    t.datetime "payment_date"
    t.decimal  "amount_collected"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "user_id"
    t.string   "currency"
  end

  add_index "bandcamp_payments", ["currency"], :name => "index_bandcamp_payments_on_currency"
  add_index "bandcamp_payments", ["user_id"], :name => "index_bandcamp_payments_on_user_id"

  create_table "line_items", :force => true do |t|
    t.datetime "purchase_date"
    t.string   "name"
    t.decimal  "price"
    t.decimal  "tax"
    t.decimal  "shipping"
    t.integer  "quantity"
    t.string   "currency"
    t.decimal  "revenue_share"
    t.decimal  "paypal_fee"
    t.string   "paypal_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "user_id"
  end

  add_index "line_items", ["paypal_id"], :name => "index_line_items_on_paypal_id"
  add_index "line_items", ["user_id"], :name => "index_line_items_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
