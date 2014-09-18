class Rating < ActiveRecord::Base
  attr_accessible :photo_id, :user_id, :value

  belongs_to :photo
  belongs_to :user
end
