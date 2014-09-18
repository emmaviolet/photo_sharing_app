class Photo < ActiveRecord::Base
  attr_accessible :album_id, :description, :image, :name

  has_many :ratings
  has_many :comments
  has_many :tags
  belongs_to :album

end
