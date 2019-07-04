class Relationship < ApplicationRecord
  belongs_to :follower, class_name: User.name
  belongs_to :followed, class_name: User.name

  scope :follower_ids, (lambda do |user_id|
    where(follower_id: user_id).pluck(:followed_id)
    end)
end
