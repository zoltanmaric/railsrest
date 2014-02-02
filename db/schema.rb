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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "geometry_columns", id: false, force: true do |t|
    t.string  "f_table_catalog",   limit: 256, null: false
    t.string  "f_table_schema",    limit: 256, null: false
    t.string  "f_table_name",      limit: 256, null: false
    t.string  "f_geometry_column", limit: 256, null: false
    t.integer "coord_dimension",               null: false
    t.integer "srid",                          null: false
    t.string  "type",              limit: 30,  null: false
  end

  create_table "spatial_ref_sys", id: false, force: true do |t|
    t.integer "srid",                   null: false
    t.string  "auth_name", limit: 256
    t.integer "auth_srid"
    t.string  "srtext",    limit: 2048
    t.string  "proj4text", limit: 2048
  end

  create_table "sport", primary_key: "spt_id", force: true do |t|
    t.string "spt_name", limit: 256
  end

  add_index "sport", ["spt_name"], name: "sport_spt_name_key", unique: true, using: :btree

# Could not dump table "timestamped_point" because of following StandardError
#   Unknown type 'geometry' for column 'tsp_point'

  create_table "tour", primary_key: "tur_id", force: true do |t|
    t.integer "tur_usr_id",       null: false
    t.integer "tur_spt_id",       null: false
    t.integer "tur_start_tsp_id"
  end

  create_table "user", primary_key: "usr_id", force: true do |t|
    t.string "usr_username", limit: 256
  end

  add_index "user", ["usr_username"], name: "user_usr_username_key", unique: true, using: :btree

end
