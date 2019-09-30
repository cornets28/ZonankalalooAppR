class Like < ApplicationRecord
    belongs_to :discussion
    belongs_to :user
  
    validates :user_id, uniqueness: { scope: :discussion_id }
end
