class Photo < ActiveRecord::Base
  attr_accessible :album_id, :description, :image, :name, :photo_file, :remote_photo_file_url
  mount_uploader :photo_file, PhotoFileUploader
  has_many :ratings
  has_many :comments
  has_many :tags
  belongs_to :album

  has_reputation :votes, source: :user, aggregated_by: :sum

  default_scope -> { excluding_default }

  validates :name, presence: true
  validates :photo_file, presence: true
  # Name weird characters
  # Name length?
  # Description, length, can't contain weird characters
  # Album_id presence, numericality
  # Photo file

  def self.excluding_default
    @default_photo ||= Photo.find_by_name("default_album_cover_image")
    self.where('photos.id != ?', @default_photo)
  end

end
