class GroupGenreSerializer < ActiveModel::Serializer
  attributes :id
  has_one :genre
  has_one :group
end
