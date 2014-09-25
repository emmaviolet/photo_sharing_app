class Album < ActiveRecord::Base
  attr_accessible :cover_photo_id, :description, :name, :user_id

  has_many :photos

  belongs_to :user

  belongs_to :cover_photo, class_name: "Photo"

  before_validation :set_default_params, :on => :create

  validates :name, presence: true
  validates :name, format: { with: /^[a-z.,!?A-Z\d\s]*$/ }
  validates :name, length: { maximum: 21 }
  validates :description, format: { with: /^[a-z.,!?A-Z\d\s]*$/ }
  validates :description, length: { maximum: 100 }
  validates :user_id, presence: true
  validates :user_id, numericality: { only_integer: true }

  # cover photo (filetype validation?)

  def set_default_params
    self.cover_photo_id ||= Photo.unscoped.find_by_name("default_album_cover_image").id
  end

end
