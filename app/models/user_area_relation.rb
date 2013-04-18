class UserAreaRelation < ActiveRecord::Base
  attr_accessible :area_id, :user_id
  
  belongs_to :user, class_name: "User"
  belongs_to :area, class_name: "Area"
  
  validates :area_id, presence: true
  validates :user_id, presence: true
end
