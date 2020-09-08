class GroupGenre < ApplicationRecord
  belongs_to :genre
  belongs_to :group
end
