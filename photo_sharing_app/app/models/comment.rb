class Comment < ActiveRecord::Base
  attr_accessible :photo_id, :text, :user_id

  belongs_to :photo
  belongs_to :user

  validates :text, presence: true
  # Text can't contain weird characters?
  # photo_id presence
  # user_id presence
end
