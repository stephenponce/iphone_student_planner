# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081107174204) do

  create_table "events", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location_name"
    t.string   "description"
    t.datetime "time_start"
    t.datetime "time_end"
    t.integer  "duration"
    t.string   "category"
    t.string   "title"
    t.string   "day"
    t.boolean  "reoccuring_event"
    t.string   "reoccurs_on"
    t.date     "reoccurs_until"
  end

  create_table "schedules", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "userName"
    t.integer  "userId"
  end

  create_table "tasks", :force => true do |t|
    t.string   "title",       :limit => 64, :null => false
    t.text     "description"
    t.date     "date"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end