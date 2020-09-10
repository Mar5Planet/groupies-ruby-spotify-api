class Group < ApplicationRecord
    has_many :comments
    has_many :commenters, through: "Fan", source: :fans

    has_many :fan_groups
    has_many :fans, through: :fan_groups

    has_many :group_songs
    has_many :songs, through: :group_songs

    has_many :group_genres
    has_many :genres, through: :group_genres

    def join_group(fan)
        FanGroup.create(fan_id: fan.id, group_id: self.id)
    end 

    def leave_group(fan)
        relation= FanGroup.find_by(group_id: self.id, fan_id: fan.id)
        relation.destroy
    end

    def has_member?(fan)
        fan.groups.find {|group| group.id == self.id}
    end

      
end
