class Tag < ActiveRecord::Base
  attr_accessible :photo_id, :text
  belongs_to :photo

  validates :text, length: { minimum: 1 }
  # Text, format of? Can't be weird
  # photo_id -> integer, presence
end
