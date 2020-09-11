class Group < ApplicationRecord
    has_many :comments
    has_many :commenters, through: "Fan", source: :fans

    has_many :fan_groups
    has_many :fans, through: :fan_groups

    has_many :group_songs
    has_many :songs, through: :group_songs

    has_many :group_genres
    has_many :genres, through: :group_genres

    def add_fan(fan)
        FanGroup.create(fan_id: fan.id, group_id: self.id)
    end 

    def remove_fan(fan)
        relation= FanGroup.find_by(group_id: self.id, fan_id: fan.id)
        relation.destroy
    end

    def has_member?(fan)
        fan.groups.find {|group| group.id == self.id}
    end

    def card_image_url
        if !self.songs.empty?
            self.songs.first.image_url
        else
            url = "https://pbs.twimg.com/profile_images/956698671751446528/J3ZUMcpq_400x400.jpg"
        end
    end

      
end
