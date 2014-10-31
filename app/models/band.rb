class Band < ActiveRecord::Base
  
  has_many :albums, dependent: :destroy #only used after has_many
  
end
