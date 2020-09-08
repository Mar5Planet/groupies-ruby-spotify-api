

require 'faker'

# create_table "comments", force: :cascade do |t|
#     t.integer "group_id", null: false
#     t.integer "fan_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["fan_id"], name: "index_comments_on_fan_id"
#     t.index ["group_id"], name: "index_comments_on_group_id"
#   end

#   create_table "fan_groups", force: :cascade do |t|
#     t.integer "group_id", null: false
#     t.integer "fan_id", null: false
#     t.index ["fan_id"], name: "index_fan_groups_on_fan_id"
#     t.index ["group_id"], name: "index_fan_groups_on_group_id"
#   end

#   create_table "fan_relationships", force: :cascade do |t|
#     t.integer "follower_id"
#     t.integer "followed_id"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end

#   create_table "fans", force: :cascade do |t|
#     t.string "name"
#     t.string "location"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end

#   create_table "genre_songs", force: :cascade do |t|
#     t.integer "song_id", null: false
#     t.integer "genre_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["genre_id"], name: "index_genre_songs_on_genre_id"
#     t.index ["song_id"], name: "index_genre_songs_on_song_id"
#   end

#   create_table "genres", force: :cascade do |t|
#     t.string "name"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end

#   create_table "group_genres", force: :cascade do |t|
#     t.integer "genre_id", null: false
#     t.integer "group_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["genre_id"], name: "index_group_genres_on_genre_id"
#     t.index ["group_id"], name: "index_group_genres_on_group_id"
#   end

#   create_table "group_songs", force: :cascade do |t|
#     t.integer "song_id", null: false
#     t.integer "group_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["group_id"], name: "index_group_songs_on_group_id"
#     t.index ["song_id"], name: "index_group_songs_on_song_id"
#   end

#   create_table "groups", force: :cascade do |t|
#     t.string "name"
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#   end

# 40.times do 
# Genre.create(name: Faker::Music.genre)
# end 

Faker::Food.fruits
# Song.destroy_all
# Fan.destroy_all
# Group.destroy_all
# FanGroup.destroy_all
# Comment.destroy_all
# GroupSong.destroy_all
# GroupGenre.destroy_all
# GenreSong.destroy_all

20.times do 
    random_song= RSpotify::Track.search(Faker::Music::Prince.song)
    Song.create(title: random_song.first.name, artist: random_song.first.artists.first.name, image_url: random_song.first.album.images[0]["url"], external_link: random_song.first.external_urls.values[0], song_genre: random_song.first.artists.first.genres.join(', '))
end 

12.times do 
    Fan.create(name: Faker::Superhero.name, location: Faker::Address.city)
end

10.times do
    Group.create(name: Faker::Quote.singular_siegler)
end

30.times do
    FanGroup.create(fan_id: Fan.all.sample.id, group_id: Group.all.sample.id)
end

20.times do
    Comment.create(fan_id: Fan.all.sample.id, group_id: Group.all.sample.id, title: Faker::Coin.name, content: Faker::Movies::PrincessBride.quote)
end

20.times do
    GroupSong.create(group_id: Group.all.sample.id, song_id: Song.all.sample.id)
end    


20.times do 
    GroupGenre.create(genre_id: Genre.all.sample.id, group_id: Group.all.sample.id)
end

20.times do 
    FanRelationship.create(follower_id: Fan.all.sample.id, followed_id: Fan.all.sample.id)
end 
