class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :albums
  has_many :photos, through: :albums

  validates :username, presence: true
  validates :username, format: { with: /^[a-zA-Z\d\s]*$/ }
  validates :username, length: { maximum: 21 }

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

end
