class Area < ActiveRecord::Base
  attr_accessible :description, :name
  before_save { |area| area.name = name.downcase }
  
  has_many :UserAreaRelations, foreign_key: "area_id", dependent: :destroy
  has_many :users, through: :UserAreaRelations, source: :user
  has_many :posts, foreign_key: "area_id", dependent: :destroy
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }, 
      length: {maximum: 25}
  validates :description, presence: true
  
  def following?(user)
    UserAreaRelation.exists?(['user_id = ? and area_id = ?', 
                  user.id, self.id])
  end
  
end
