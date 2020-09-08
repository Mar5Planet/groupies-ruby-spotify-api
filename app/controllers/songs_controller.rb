class SongsController < ApplicationController

    #for testing purposes only
    def index
        @songs = Song.all
    end


end
