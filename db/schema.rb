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

ActiveRecord::Schema.define(version: 20140622141554) do

  create_table "columns", force: true do |t|
    t.integer  "table_id"
    t.string   "name",                              null: false
    t.integer  "ordinal_position",                  null: false
    t.string   "default_value"
    t.string   "data_type",                         null: false
    t.boolean  "is_nullable",       default: true
    t.boolean  "is_primary_key",    default: false
    t.boolean  "is_auto_increment", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "columns", ["table_id"], name: "index_columns_on_table_id", using: :btree

  create_table "companies", force: true do |t|
    t.string   "name",                      null: false
    t.datetime "join_date"
    t.boolean  "is_active",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "diagram_tables", force: true do |t|
    t.integer  "diagram_id"
    t.integer  "table_id"
    t.integer  "top_position"
    t.integer  "left_position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diagram_tables", ["diagram_id"], name: "fk_diagram_tables_diagram", using: :btree
  add_index "diagram_tables", ["table_id"], name: "fk_diagram_tables_table", using: :btree

  create_table "diagrams", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "relationship_columns", force: true do |t|
    t.integer  "parent_column_id"
    t.integer  "child_column_id"
    t.integer  "relationship_id"
    t.integer  "ordinal_position", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationship_columns", ["child_column_id"], name: "fk_relationship_columns_child_column", using: :btree
  add_index "relationship_columns", ["parent_column_id"], name: "fk_relationship_columns_parent_column", using: :btree
  add_index "relationship_columns", ["relationship_id"], name: "fk_relationship_columns_relationships", using: :btree

  create_table "relationships", force: true do |t|
    t.string   "name",            null: false
    t.integer  "parent_table_id"
    t.integer  "child_table_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["child_table_id"], name: "index_relationships_on_child_table_id", using: :btree
  add_index "relationships", ["parent_table_id"], name: "index_relationships_on_parent_table_id", using: :btree

  create_table "servers", force: true do |t|
    t.string   "name",                        null: false
    t.string   "machine_name"
    t.string   "network_name"
    t.string   "ip_address"
    t.boolean  "is_active",    default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "tables", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
