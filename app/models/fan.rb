class Fan < ApplicationRecord
    has_many :active_relationships, class_name: "FanRelationship", foreign_key: :follower_id, dependent: :destroy
    has_many :followeds, through: :active_relationships, source: :followed
  
    has_many :passive_relationships, class_name: "FanRelationship", foreign_key: :followed_id, dependent: :destroy
    has_many :followers, through: :passive_relationships, source: :follower

    has_many :fan_groups
    has_many :groups, through: :fan_groups

    has_many :comments
end
