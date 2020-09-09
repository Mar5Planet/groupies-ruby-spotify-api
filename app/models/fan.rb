class Fan < ApplicationRecord

    has_many :followeds, class_name: "FanRelationship", foreign_key: :follower_id, dependent: :destroy
    # has_many :followed, through: :active_relationships, source: :followed
  
    has_many :followers, class_name: "FanRelationship", foreign_key: :followed_id, dependent: :destroy
    # has_many :followers, through: :passive_relationships, source: :follower

    has_many :fan_groups
    has_many :groups, through: :fan_groups

    has_many :comments
end
