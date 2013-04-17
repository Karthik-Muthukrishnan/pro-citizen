class Area < ActiveRecord::Base
  attr_accessible :description, :name
  before_save { |area| area.name = name.downcase }
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }, 
      length: {maximum: 25}
  validates :description, presence: true
end
