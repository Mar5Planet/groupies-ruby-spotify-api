class Comment < ApplicationRecord
  belongs_to :group
  belongs_to :fan
end
