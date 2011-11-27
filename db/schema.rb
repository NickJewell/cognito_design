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

ActiveRecord::Schema.define(:version => 20111127115559) do

  create_table "attendees", :force => true do |t|
    t.string   "attendee_flag"
    t.string   "watch_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "event_id"
  end

  create_table "channels", :force => true do |t|
    t.string   "channel_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "difficulties", :force => true do |t|
    t.string   "difficulty_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_attendees", :force => true do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "attendee_flag"
    t.string   "watch_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_resources", :force => true do |t|
    t.integer  "event_id"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.integer  "user_host_id"
    t.integer  "channel_id"
    t.integer  "difficulty_id"
    t.integer  "status_id"
    t.integer  "timezone_id"
    t.integer  "size_id"
    t.string   "title"
    t.string   "content"
    t.datetime "session_datetime"
    t.integer  "duration"
    t.string   "prereqs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id"], :name => "index_microposts_on_user_id"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "resources", :force => true do |t|
    t.string   "ext_int_indicator"
    t.string   "resource_url"
    t.string   "resource_description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sizes", :force => true do |t|
    t.string   "size_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", :force => true do |t|
    t.string   "status_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "timezones", :force => true do |t|
    t.string   "timezone_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.boolean  "admin",              :default => false
    t.string   "staff_id"
    t.string   "city"
    t.string   "phone"
    t.string   "phone_alt"
    t.string   "conference_line"
    t.string   "webex_details"
    t.string   "vc_details"
    t.string   "MBTI"
    t.decimal  "reputation"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "watchers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attendee_flag"
    t.string   "watch_flag"
    t.integer  "user_id"
    t.integer  "event_id"
  end

end
