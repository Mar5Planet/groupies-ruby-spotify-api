class FanRelationship < ApplicationRecord
    belongs_to :followed, class_name: "Fan", foreign_key: :followed_id
    belongs_to :folllower, class_name: "Fan", foreign_key: :follower_id
end
