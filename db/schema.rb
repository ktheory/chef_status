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

ActiveRecord::Schema.define(:version => 20110320181307) do

  create_table "chef_reports", :force => true do |t|
    t.string   "node"
    t.boolean  "success",    :default => true, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chef_reports", ["node"], :name => "index_chef_reports_on_node", :unique => true
  add_index "chef_reports", ["updated_at"], :name => "index_chef_reports_on_updated_at"

end
