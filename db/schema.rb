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

ActiveRecord::Schema.define(:version => 20121110020702) do

  create_table "assignments", :force => true do |t|
    t.integer  "teacher_id"
    t.integer  "group_id"
    t.integer  "problem_set_id"
    t.integer  "problem_id"
    t.datetime "start_at"
    t.datetime "due_at"
    t.integer  "value"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "assignments", ["group_id"], :name => "index_assignments_on_group_id"
  add_index "assignments", ["problem_id"], :name => "index_assignments_on_problem_id"
  add_index "assignments", ["problem_set_id"], :name => "index_assignments_on_problem_set_id"
  add_index "assignments", ["teacher_id"], :name => "index_assignments_on_teacher_id"

  create_table "groups", :force => true do |t|
    t.integer  "teacher_id"
    t.string   "name"
    t.string   "description"
    t.string   "tags"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "groups", ["teacher_id"], :name => "index_groups_on_teacher_id"

  create_table "problem_sets", :force => true do |t|
    t.integer  "group_id"
    t.datetime "start_at"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "problem_sets", ["group_id"], :name => "index_problem_sets_on_group_id"

  create_table "problem_tests", :force => true do |t|
    t.integer  "problem_id"
    t.text     "driver"
    t.text     "expected_result"
    t.boolean  "show_result"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "problems", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "language"
    t.string   "tags"
    t.integer  "teacher_id"
    t.integer  "default_value"
    t.text     "template_code"
    t.text     "reference_code"
    t.decimal  "max_cpu_seconds",   :precision => 10, :scale => 0
    t.decimal  "max_total_seconds", :precision => 10, :scale => 0
    t.decimal  "max_megabytes",     :precision => 10, :scale => 0
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  create_table "student_groups", :force => true do |t|
    t.integer  "student_id"
    t.integer  "group_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "student_groups", ["group_id"], :name => "index_student_groups_on_group_id"
  add_index "student_groups", ["student_id"], :name => "index_student_groups_on_student_id"

  create_table "students", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "students", ["email"], :name => "index_students_on_email", :unique => true
  add_index "students", ["reset_password_token"], :name => "index_students_on_reset_password_token", :unique => true

  create_table "submissions", :force => true do |t|
    t.integer  "student_id"
    t.integer  "assignment_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "teachers", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "teachers", ["email"], :name => "index_teachers_on_email", :unique => true
  add_index "teachers", ["reset_password_token"], :name => "index_teachers_on_reset_password_token", :unique => true

end
