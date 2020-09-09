

require 'faker'

40.times do 
Genre.create(name: Faker::Music.genre)
end 

20.times do 
    random_song= RSpotify::Track.search(Faker::Music::Prince.song)
    Song.create(title: random_song.first.name, artist: random_song.first.artists.first.name, image_url: random_song.first.album.images[0]["url"], external_link: random_song.first.external_urls.values[0], song_genre: random_song.first.artists.first.genres.join(', '))
end 

12.times do 
    Fan.create(name: Faker::Superhero.name, location: Faker::Address.city, profile_image_url: Faker::Fillmurray.image(grayscale: false, width: 100, height: 200))
end

10.times do
    Group.create(name: Faker::Quote.singular_siegler, description: Faker::Quotes::Rajnikanth.joke)
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
