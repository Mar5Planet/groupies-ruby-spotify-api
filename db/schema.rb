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

ActiveRecord::Schema.define(version: 2020_09_08_204816) do

  create_table "comments", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "fan_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "content"
    t.index ["fan_id"], name: "index_comments_on_fan_id"
    t.index ["group_id"], name: "index_comments_on_group_id"
  end

  create_table "fan_groups", force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "fan_id", null: false
    t.index ["fan_id"], name: "index_fan_groups_on_fan_id"
    t.index ["group_id"], name: "index_fan_groups_on_group_id"
  end

  create_table "fan_relationships", force: :cascade do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fans", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "profile_image_url"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genre_songs", force: :cascade do |t|
    t.integer "song_id", null: false
    t.integer "genre_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_genre_songs_on_genre_id"
    t.index ["song_id"], name: "index_genre_songs_on_song_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "group_genres", force: :cascade do |t|
    t.integer "genre_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_group_genres_on_genre_id"
    t.index ["group_id"], name: "index_group_genres_on_group_id"
  end

  create_table "group_songs", force: :cascade do |t|
    t.integer "song_id", null: false
    t.integer "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_songs_on_group_id"
    t.index ["song_id"], name: "index_group_songs_on_song_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.string "artist"
    t.string "image_url"
    t.string "external_link"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "song_genre"
  end

  add_foreign_key "comments", "fans"
  add_foreign_key "comments", "groups"
  add_foreign_key "fan_groups", "fans"
  add_foreign_key "fan_groups", "groups"
  add_foreign_key "genre_songs", "genres"
  add_foreign_key "genre_songs", "songs"
  add_foreign_key "group_genres", "genres"
  add_foreign_key "group_genres", "groups"
  add_foreign_key "group_songs", "groups"
  add_foreign_key "group_songs", "songs"
end
