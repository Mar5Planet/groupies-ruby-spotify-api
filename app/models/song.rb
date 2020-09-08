class Song < ApplicationRecord
    has_many :group_songs
    has_many :groups, through: :group_songs

    has_many :genre_songs
    has_many :genres, through: :genre_songs
end
