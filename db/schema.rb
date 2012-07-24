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

ActiveRecord::Schema.define(:version => 20120724142736) do

  create_table "codes", :force => true do |t|
    t.text     "source_code"
    t.integer  "runnable_id"
    t.string   "runnable_type"
    t.boolean  "is_graded"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "codes", ["runnable_id"], :name => "index_codes_on_runnable_id"

  create_table "results", :force => true do |t|
    t.integer  "code_id"
    t.integer  "testcase_id"
    t.text     "input"
    t.text     "output"
    t.boolean  "is_graded"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "submissions", :force => true do |t|
    t.integer  "task_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "submissions", ["task_id"], :name => "index_submissions_on_task_id"
  add_index "submissions", ["user_id"], :name => "index_submissions_on_user_id"

  create_table "tasks", :force => true do |t|
    t.integer  "index"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "testcases", :force => true do |t|
    t.integer  "task_id"
    t.text     "input_data"
    t.boolean  "public"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "testcases", ["task_id"], :name => "index_testcases_on_task_id"

  create_table "users", :force => true do |t|
    t.string   "login",                            :null => false
    t.string   "crypted_password",                 :null => false
    t.string   "password_salt",                    :null => false
    t.string   "persistence_token",                :null => false
    t.integer  "login_count",       :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "is_admin"
  end

end
