class User < ApplicationRecord
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships
  has_many :activities, dependent: :destroy
  has_many :lessons, dependent: :destroy
  has_many :word_details, dependent: :destroy
  has_many :words, through: :word_details

  def follow other_user
    following << other_user
  end

  def feed
    @activity = Activity.follow_current_user Relationship.follower_ids(id) << id
    @activity.available_act(id)
  end
end
