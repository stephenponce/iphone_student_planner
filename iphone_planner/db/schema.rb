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

ActiveRecord::Schema.define(:version => 20081208031141) do

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
    t.string   "frequency"
    t.integer  "reoccurrence_id"
    t.date     "reoccurs_until"
  end

  create_table "events_reoccurrences", :id => false, :force => true do |t|
    t.integer "event_id"
    t.integer "reoccurrence_id"
  end

  add_index "events_reoccurrences", ["reoccurrence_id"], :name => "index_events_reoccurrences_on_reoccurrence_id"
  add_index "events_reoccurrences", ["event_id"], :name => "index_events_reoccurrences_on_event_id"

  create_table "reoccurrences", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "frequency",     :default => "once"
    t.boolean  "sunday",        :default => false
    t.boolean  "monday",        :default => false
    t.boolean  "tuesday",       :default => false
    t.boolean  "wednesday",     :default => false
    t.boolean  "thursday",      :default => false
    t.boolean  "friday",        :default => false
    t.boolean  "saturday",      :default => false
    t.string   "week_of_month"
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
