class SongsController < ApplicationController

    #for testing purposes only
    def index
        @songs = Song.all
    end

    def new 
        @song = Song.new
    end 

    def create
        song_match = RSpotify::Track.search(song_params[:title])
        @song = Song.new(:title => song_match.first.name, :artist => song_match.first.artists.first.name, :image_url => song_match.first.album.images[0]["url"], external_link: song_match.first.external_urls.values[0], song_genre: song_match.first.artists.first.genres.join(', '))
        byebug

        
        if @song.artist == song_params[:artist]
            @song.save

            @gs = GroupSong.create(:group_id => song_params[:group_id], :song_id => @song.id)
            redirect_to group_path(@gs.group)
        else 
            flash[:match_error] = "Song/Artist match not found did you mean #{@song.title} by #{@song.artist}?"
            redirect_to group_path(@gs.group)
        end 

        

    end

    private
    def song_params
        params.require(:song).permit(:title, :artist, :group_id)
    end
end

