class Genre < ApplicationRecord
    has_many :group_genres
    has_many :groups, through: :group_genres

    has_many :songs_genre
    has_many :songs, through: :group_songs 

end
