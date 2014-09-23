class Tag < ActiveRecord::Base
  attr_accessible :photo_id, :text
  belongs_to :photos

  validates :text, length: { minimum: 1 }
end
