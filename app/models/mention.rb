class Mention < ActiveRecord::Base
  belongs_to :users, class_name: 'User', foreign_key: 'mention_id'
  belongs_to :status
end
