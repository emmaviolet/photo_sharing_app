class Album < ActiveRecord::Base
  attr_accessible :cover_photo_id, :description, :name, :user_id

  has_many :photos

  belongs_to :user

  belongs_to :cover_photo, class_name: "Photo"

  before_validation :set_default_params, :on => :create

  validates :name, presence: true
  validates :user_id, presence: true
  # validates_inclusion_of :format, in: %w( jpg gif png ), message: "extension %{value} is not included in the list"
  # name -> can't be certain characters?
  # description format of?
  # cover photo (filetype validation?)

  def set_default_params
    self.cover_photo_id ||= Photo.find_by_name("default_album_cover_image").id
  end

end
