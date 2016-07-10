class Status < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'

  validates :body, presence: true
  validates :creator, presence: true

  after_save :extract_mentions

  def extract_mentions
    mentions = self.body.scan(/@(\w*)/).flatten
    mentions.each do |name| 
       user = User.find_by(username: name)
       Mention.create(mention_id: user.id, status_id: self.id) if user
    end if mentions
  end
end
