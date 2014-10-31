class Note < ActiveRecord::Base
  
  validates :description, presence: true
  
  belongs_to :track
  
  belongs_to :user
  
  
end
