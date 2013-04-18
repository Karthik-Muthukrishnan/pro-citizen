class Area < ActiveRecord::Base
  attr_accessible :description, :name
  before_save { |area| area.name = name.downcase }
  
  has_many :user_area_relations, foreign_key: "area_id", dependent: :destroy
  has_many :users, through: :user_area_relations, source: :user
  
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }, 
      length: {maximum: 25}
  validates :description, presence: true
  
  def following?(user)
    user_area_relations.find_by_user_id(user.id)
  end
  
  def follow!(user)
    user_area_relations.create!(user_id: user.id)
  end
  
  def unfollow!(user)
    user_area_relations.find_by_user_id(user.id).destroy
  end
  
end
