class Group < ApplicationRecord
    has_many :comments
    has_many :commenters, through: "Fan", source: :fans

    has_many :fan_groups
    has_many :fans, through: :fan_groups

    has_many :group_songs
    has_many :songs, through: :group_songs

    has_many :group_genres
    has_many :genres, through: :group_genres

end
