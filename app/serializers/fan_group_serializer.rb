class FanGroupSerializer < ActiveModel::Serializer
  attributes :id
  has_one :group
  has_one :fan
end
