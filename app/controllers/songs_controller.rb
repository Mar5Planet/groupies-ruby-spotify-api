class SongsController < ApplicationController

    #for testing purposes only
    def index
        @songs = Song.all
    end

    def new 
        @song = Song.new
    end 

    # def create
    #     song_match = RSpotify::Track.search(song_params[:name])
    #     @song = Song.create(:name => song_match.first.name, artist: song_match.first.artists.first.name, image_url: random_song.first.album.images[0]["url"], external_link: random_song.first.external_urls.values[0], song_genre: song_match.first.artists.first.genres.join(', '))
    # end

    private
    def song_params
        params.require(:song).permit(:name)
    end
end

