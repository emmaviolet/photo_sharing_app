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
  validates :name, format: { with: /^[a-zA-Z\d\s]*$/ }
  validates :name, length: { maximum: 21 }
  validates :description, format: { with: /^[a-zA-Z\d\s]*$/ }
  validates :description, length: { maximum: 100 }
  validates :album_id, presence: true
  validates :album_id, numericality: { only_integer: true }
  validates :photo_file, presence: true

  # Photo file - filetype validation?

end
