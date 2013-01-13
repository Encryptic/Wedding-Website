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

ActiveRecord::Schema.define(:version => 20130113191921) do

  create_table "data_files", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "guests", :force => true do |t|
    t.string   "code"
    t.integer  "adult_guests"
    t.integer  "child_guests"
    t.date     "rsvp_date"
    t.text     "notes"
    t.text     "private_notes"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "will_attend"
    t.string   "last_name"
    t.string   "first_name"
    t.string   "email"
    t.integer  "toddler_guests"
  end

  create_table "madlibs", :force => true do |t|
    t.string   "field1"
    t.string   "field2"
    t.string   "field3"
    t.string   "field4"
    t.string   "field5"
    t.string   "field6"
    t.string   "field7"
    t.string   "field8"
    t.string   "field9"
    t.string   "field10"
    t.string   "field11"
    t.integer  "guest_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "name"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end
