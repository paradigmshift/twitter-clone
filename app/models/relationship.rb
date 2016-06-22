class Relationship < ActiveRecord::Base
  belongs_to :followers, class_name: 'User', foreign_key: 'follower_id'
  belongs_to :leaders, class_name: 'User', foreign_key: 'leader_id'
end
