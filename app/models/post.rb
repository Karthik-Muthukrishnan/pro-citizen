class Post < ActiveRecord::Base
  attr_accessible :content, :area_id
  
  belongs_to :area
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :area_id, presence: true
  
  default_scope order: 'posts.created_at DESC'
  
  def self.from_users_followed_by(user)
    followed_area_ids = "SELECT area_id FROM User_Area_Relations
                         WHERE user_id = :user_id"
    where("area_id IN (#{followed_area_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
  
end
