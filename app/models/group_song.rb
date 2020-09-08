class GroupSong < ApplicationRecord
  belongs_to :song
  belongs_to :group
end
