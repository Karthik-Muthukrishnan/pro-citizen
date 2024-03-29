class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  
  has_many :UserAreaRelations, foreign_key: "user_id", dependent: :destroy
  has_many :areas, through: :UserAreaRelations, source: :area
  has_many :posts, foreign_key: "user_id", dependent: :destroy
  
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
  			uniqueness: {case_sensitive: false}
  			
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  def feed
    Post.from_users_followed_by(self)
  end
  
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
