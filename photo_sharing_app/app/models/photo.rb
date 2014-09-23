class Photo < ActiveRecord::Base
  attr_accessible :album_id, :description, :image, :name, :photo_file, :remote_photo_file_url
  mount_uploader :photo_file, PhotoFileUploader
  has_many :ratings
  has_many :comments
  has_many :tags
  belongs_to :album
  accepts_nested_attributes_for :tags

  has_reputation :votes, source: :user, aggregated_by: :sum

  validates :name, presence: true
  validates :photo_file, presence: true
  # Name weird characters
  # Name length?
  # Description, length, can't contain weird characters
  # Album_id presence, numericality
  # Photo file

end
