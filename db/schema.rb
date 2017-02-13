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

ActiveRecord::Schema.define(version: 20170213002529) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "coordinates", force: :cascade do |t|
    t.integer   "sensor_array_id"
    t.geography "point",             limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.float     "point_accuracy"
    t.float     "heading"
    t.float     "speed"
    t.float     "altitude"
    t.float     "altitude_accuracy"
    t.datetime  "timestamp"
    t.datetime  "created_at",                                                                 null: false
    t.datetime  "updated_at",                                                                 null: false
    t.index ["sensor_array_id"], name: "index_coordinates_on_sensor_array_id", using: :btree
  end

  create_table "crafts", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sensor_arrays", force: :cascade do |t|
    t.string   "name"
    t.integer  "craft_id"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["craft_id"], name: "index_sensor_arrays_on_craft_id", using: :btree
  end

  create_table "weather_readings", force: :cascade do |t|
    t.float    "temp"
    t.float    "humidity"
    t.float    "pressure"
    t.integer  "sensor_array_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["sensor_array_id"], name: "index_weather_readings_on_sensor_array_id", using: :btree
  end

  add_foreign_key "coordinates", "sensor_arrays"
  add_foreign_key "sensor_arrays", "crafts"
  add_foreign_key "weather_readings", "sensor_arrays"
end
