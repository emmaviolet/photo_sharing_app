class Album < ActiveRecord::Base
  attr_accessible :cover_photo_id, :description, :name, :user_id

  has_many :photos

  belongs_to :user

  belongs_to :cover_photo, class_name: "Photo"

  before_validation :set_default_params, :on => :create

  validates :name, presence: true
  # name -> can't be certain characters?
  # user_id presence
  # description format of?
  # cover photo (filetype validation?)

  def set_default_params
    self.cover_photo_id ||= Photo.find_by_name("default_album_cover_image").id
  end

end
