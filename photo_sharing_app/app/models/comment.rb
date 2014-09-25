class Comment < ActiveRecord::Base
  attr_accessible :photo_id, :text, :user_id

  belongs_to :photo
  belongs_to :user

  validates :text, presence: true
  validates :text, format: { with: /^[a-z.,!?A-Z\d\s]*$/ }
  validates :text, length: { maximum: 100 }
  validates :photo_id, presence: true
  validates :photo_id, numericality: { only_integer: true }
  validates :user_id, presence: true
  validates :user_id, numericality: { only_integer: true }
end
