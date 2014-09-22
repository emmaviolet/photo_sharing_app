class Album < ActiveRecord::Base
  attr_accessible :cover_photo, :description, :name, :user_id

  has_many :photos
  belongs_to :user

  before_validation :set_default_params, :on => :create

  def set_default_params
    self.cover_photo ||= Photo.find_by_name("default_album_cover_image").id
  end



end
