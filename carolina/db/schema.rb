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

ActiveRecord::Schema.define(:version => 20130418041503) do

  create_table "countries", :force => true do |t|
    t.string   "continent"
    t.string   "name"
    t.string   "datacode"
    t.integer  "total_area"
    t.integer  "population"
    t.float    "population_growth"
    t.float    "infant_mortality"
    t.integer  "gdp_agri"
    t.float    "inflation"
    t.integer  "gdp_ind"
    t.string   "capital"
    t.string   "government"
    t.date     "indep_date"
    t.integer  "gdp_serv"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "searches", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
