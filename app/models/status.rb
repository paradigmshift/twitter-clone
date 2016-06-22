class Status < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'

  validates :body, presence: true
  validates :creator, presence: true
end
