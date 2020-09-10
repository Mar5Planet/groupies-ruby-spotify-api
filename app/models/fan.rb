class Fan < ApplicationRecord

    has_many :followeds, class_name: "FanRelationship", foreign_key: :follower_id, dependent: :destroy
    # has_many :followed, through: :active_relationships, source: :followed
  
    has_many :followers, class_name: "FanRelationship", foreign_key: :followed_id, dependent: :destroy
    # has_many :followers, through: :passive_relationships, source: :follower

    has_many :fan_groups
    has_many :groups, through: :fan_groups

    has_many :comments

    has_secure_password


    def follow(followed_fan)
        FanRelationship.create(follower_id: self.id, followed_id: followed_fan.id)
    end 

    def unfollow(followed_fan)
        relation= FanRelationship.find_by(follower_id: self.id, followed_id: followed_fan.id)
        relation.destroy
    end

    def already_follows?(show_fan)
        show_fan.followers.find {|follower| follower.follower_id == self.id}
    end

    
end
