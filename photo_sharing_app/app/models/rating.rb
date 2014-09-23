class Rating < ActiveRecord::Base
  attr_accessible :photo_id, :user_id, :value

  belongs_to :photo
  belongs_to :user
  # photo_id, presence, numericality
  # user_id, presence numericality
  # Caveat, user_id / photo_id have to be in the database?
  # Value -> has to be an integer

end
