# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_23_221228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "leagues", force: :cascade do |t|
    t.string "name"
    t.integer "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "leagues_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "league_id", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string "day"
    t.string "kimarite"
    t.string "winner"
    t.integer "points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "matches_wrestlers", id: false, force: :cascade do |t|
    t.bigint "wrestler_id", null: false
    t.bigint "match_id", null: false
  end

  create_table "records", force: :cascade do |t|
    t.string "tournament"
    t.integer "wins"
    t.integer "losses"
    t.bigint "wrestler_id"
    t.index ["wrestler_id"], name: "index_records_on_wrestler_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "points"
    t.bigint "user_id"
    t.bigint "league_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["league_id"], name: "index_teams_on_league_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "teams_wrestlers", id: false, force: :cascade do |t|
    t.bigint "wrestler_id", null: false
    t.bigint "team_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "avatar"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wrestlers", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "img"
    t.string "current_rank"
    t.string "highest_rank"
    t.string "division"
    t.integer "current_wins"
    t.integer "current_losses"
    t.integer "yusho"
    t.integer "shukun_sho"
    t.integer "kanto_sho"
    t.integer "gino_sho"
    t.integer "kinboshi"
    t.string "heya"
    t.integer "height"
    t.integer "weight"
    t.boolean "active"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
