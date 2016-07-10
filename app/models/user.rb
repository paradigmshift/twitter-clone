class User < ActiveRecord::Base
  has_secure_password

  has_many :statuses, foreign_key: 'creator_id'
  has_many :mentions, foreign_key: 'mention_id'

  has_many :follower_relationships, class_name: "Relationship", foreign_key: "leader_id"
  has_many :leader_relationships, class_name: "Relationship", foreign_key: "follower_id"

  has_many :followers, through: :follower_relationships , source: :followers
  has_many :leaders, through: :leader_relationships , source: :leaders

  validates :username, presence: true
end
