class Photo < ActiveRecord::Base
  attr_accessible :album_id, :description, :image, :name, :photo_file, :remote_photo_file_url
  mount_uploader :photo_file, PhotoFileUploader
  has_many :ratings
  has_many :comments
  has_many :tags
  belongs_to :album
end
