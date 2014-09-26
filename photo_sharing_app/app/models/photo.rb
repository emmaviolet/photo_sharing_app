class Photo < ActiveRecord::Base
  attr_accessible :album_id, :description, :name, :photo_file, :remote_photo_file_url, :tags
  mount_uploader :photo_file, PhotoFileUploader
  has_many :ratings
  has_many :comments, dependent: :destroy
  belongs_to :album

  has_reputation :votes, source: :user, aggregated_by: :sum

  default_scope -> { excluding_default }

  validates :name, presence: true
  validates :name, format: { with: /^[a-z.,!?A-Z\d\s]*$/ }
  validates :name, length: { maximum: 21 }
  validates :description, format: { with: /^[a-z.,!?A-Z\d\s]*$/ }
  validates :description, length: { maximum: 100 }
  validates :album_id, presence: true
  validates :album_id, numericality: { only_integer: true }
  validates :photo_file, presence: true

  # Photo file - filetype validation?

  def self.excluding_default
    @default_photo ||= Photo.find_by_name("default_album_cover_image")
    self.where('photos.id != ?', @default_photo)
  end

end
