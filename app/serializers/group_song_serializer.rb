class GroupSongSerializer < ActiveModel::Serializer
  attributes :id
  has_one :song
  has_one :group
end
