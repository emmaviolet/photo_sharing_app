class Album < ActiveRecord::Base
  attr_accessible :cover_photo, :description, :name, :user_id

  has_many :photos
  belongs_to :user
end
