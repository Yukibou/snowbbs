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

ActiveRecord::Schema.define(version: 20181226022357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string   "name",                      null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "public",     default: true
  end

  create_table "avalanche_areas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "avalanche_infomations", force: :cascade do |t|
    t.datetime "announced_at"
    t.string   "avalanche"
    t.string   "snowpack"
    t.string   "weather"
    t.string   "travel_advisory"
    t.string   "alpine_zone"
    t.string   "alpine_trend"
    t.string   "alpine_confidence"
    t.string   "alpine_comments"
    t.string   "treeline_zone"
    t.string   "treeline_trend"
    t.string   "treeline_confidence"
    t.string   "treeline_comments"
    t.string   "below_treeline_zone"
    t.string   "below_treeline_trend"
    t.string   "below_treeline_confidence"
    t.string   "below_treeline_comments"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id"
    t.integer  "area_id"
    t.index ["area_id"], name: "index_avalanche_infomations_on_area_id", using: :btree
    t.index ["user_id"], name: "index_avalanche_infomations_on_user_id", using: :btree
  end

  create_table "avalanche_problems", force: :cascade do |t|
    t.string   "avalanche_type"
    t.string   "zone"
    t.string   "slope_aspect"
    t.string   "triggering"
    t.string   "size"
    t.string   "comments"
    t.integer  "avalanche_infomation_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["avalanche_infomation_id"], name: "index_avalanche_problems_on_avalanche_infomation_id", using: :btree
  end

  create_table "danger_ratings", force: :cascade do |t|
    t.integer  "observation_id"
    t.string   "alpine_zone"
    t.string   "treeline_zone"
    t.string   "below_treeline_zone"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "alpine_comments"
    t.string   "alpine_confidence"
    t.string   "treeline_comments"
    t.string   "treeline_confidence"
    t.string   "below_treeline_comments"
    t.string   "below_treeline_confidence"
    t.index ["observation_id"], name: "index_danger_ratings_on_observation_id", using: :btree
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer  "observation_id"
    t.integer  "priority",       default: 1
    t.string   "problem"
    t.boolean  "has_observe",    default: false
    t.string   "weak_layer"
    t.string   "potential_size"
    t.string   "triggering"
    t.string   "sensitivity"
    t.string   "spatial"
    t.string   "terrain"
    t.string   "memo"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "has_weak_layer", default: false
    t.index ["observation_id"], name: "index_evaluations_on_observation_id", using: :btree
  end

  create_table "observations", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "observation_at"
    t.string   "mountain"
    t.string   "location"
    t.integer  "elevation_low"
    t.integer  "elevation_high"
    t.string   "sky"
    t.string   "sky_comments"
    t.string   "wind_speed"
    t.string   "wind_direction"
    t.string   "wind_comments"
    t.string   "precipitation_type"
    t.string   "precipitation_rate"
    t.string   "precipitation_comments"
    t.string   "avalanches"
    t.boolean  "avalanche_occurred",                                 default: false
    t.string   "snowpack"
    t.string   "comments"
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.integer  "area_id"
    t.boolean  "publish",                                            default: true
    t.string   "movie_url"
    t.string   "images",                                             default: [],                 array: true
    t.decimal  "temperature_low",            precision: 3, scale: 1
    t.decimal  "temperature_high",           precision: 3, scale: 1
    t.string   "temperature_low_comments"
    t.string   "temperature_high_comments"
    t.string   "temperature_low_hrs"
    t.integer  "temperature_low_elevation"
    t.string   "temperature_high_hrs"
    t.integer  "temperature_high_elevation"
    t.string   "general_comments"
    t.string   "co_worker"
    t.string   "spin_nos"
    t.integer  "avalanche_infomation_id"
    t.index ["area_id"], name: "index_observations_on_area_id", using: :btree
    t.index ["avalanche_infomation_id"], name: "index_observations_on_avalanche_infomation_id", using: :btree
    t.index ["user_id"], name: "index_observations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "name"
    t.integer  "role"
    t.boolean  "public",                 default: true
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "zone_details", force: :cascade do |t|
    t.integer  "avalanche_problem_id"
    t.integer  "zone"
    t.boolean  "aspect_n",             default: false
    t.integer  "aspect_n_power",       default: 0
    t.boolean  "aspect_ne",            default: false
    t.integer  "aspect_ne_power",      default: 0
    t.boolean  "aspect_e",             default: false
    t.integer  "aspect_e_power",       default: 0
    t.boolean  "aspect_se",            default: false
    t.integer  "aspect_se_power",      default: 0
    t.boolean  "aspect_s",             default: false
    t.integer  "aspect_s_power",       default: 0
    t.boolean  "aspect_sw",            default: false
    t.integer  "aspect_sw_power",      default: 0
    t.boolean  "aspect_w",             default: false
    t.integer  "aspect_w_power",       default: 0
    t.boolean  "aspect_nw",            default: false
    t.integer  "aspect_nw_power",      default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.index ["avalanche_problem_id"], name: "index_zone_details_on_avalanche_problem_id", using: :btree
  end

end
