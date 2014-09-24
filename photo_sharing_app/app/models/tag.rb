class Tag < ActiveRecord::Base
  attr_accessible :photo_id, :text
  belongs_to :photo

  validates :text, format: { with: /^[a-zA-Z\d\s]*$/ }
  validates :text, length: { minimum: 1, maximum: 10 }
  validates :photo_id, presence: true
  validates :photo_id, numericality: { only_integer: true }
end
