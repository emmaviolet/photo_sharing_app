class Photo < ActiveRecord::Base
  attr_accessible :album_id, :description, :image, :name, :photo_file, :remote_photo_file_url, :comments_attributes
  mount_uploader :photo_file, PhotoFileUploader
  has_many :ratings
  has_many :comments
  has_many :tags
  belongs_to :album
  accepts_nested_attributes_for :comments, :reject_if => proc { |attributes| attributes['text'].blank? }
end
