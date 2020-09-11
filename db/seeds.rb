

require 'faker'

40.times do 
Genre.find_or_create_by(name: Faker::Music.genre)
end 

#Faker::Music.band 

500.times do 
    random_songs = RSpotify::Track.search(Faker::Music.genre)
    random_song = random_songs.sample
    Song.find_or_create_by(title: random_song.name, artist: random_song.artists.first.name, image_url: random_song.album.images[0]["url"], external_link: random_song.external_urls.values[0], song_genre: random_song.artists.first.genres.join(', '))
end 

12.times do 
    Fan.create(name: Faker::Superhero.name, location: Faker::Address.city, profile_image_url: Faker::Avatar.image, password_digest: "123456")
end
#byebug

#Faker::Fillmurray.image(grayscale: false, width: 100, height: 200), password_digest: 12345

40.times do
    Group.create(name: Faker::Quote.singular_siegler, description: Faker::Quote.famous_last_words)
end

100.times do
    FanGroup.create(fan_id: Fan.all.sample.id, group_id: Group.all.sample.id)
end

300.times do
    Comment.create(fan_id: Fan.all.sample.id, group_id: Group.all.sample.id, content: Faker::TvShows::AquaTeenHungerForce.quote)
end

400.times do
    GroupSong.find_or_create_by(group_id: Group.all.sample.id, song_id: Song.all.sample.id)
end    


100.times do 
    GroupGenre.create(genre_id: Genre.all.sample.id, group_id: Group.all.sample.id)
end

50.times do 
    FanRelationship.create(follower_id: Fan.all.sample.id, followed_id: Fan.all.sample.id)
end 
