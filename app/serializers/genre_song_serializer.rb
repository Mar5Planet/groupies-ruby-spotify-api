class GenreSongSerializer < ActiveModel::Serializer
  attributes :id
  has_one :song
  has_one :genre
end
