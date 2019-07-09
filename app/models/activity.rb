class Activity < ApplicationRecord
  belongs_to :user

  default_scope{order created_at: :desc}
  scope :follow_current_user, (lambda do |follower_ids, user_id|
    where(user_id: follower_ids<<user_id)
    end)
  scope :available_act, (lambda do |user_id|
    where(act_type: :published).or(where(user_id: user_id))
    end)
  scope :id_less_than, ->(last_id){where("id < ?", last_id)}

  enum act_type: {published: 0, privated: 1}
end
