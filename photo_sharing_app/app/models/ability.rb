class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new 
    if user.role? :admin
      can :manage, :all
    else
    # can :manage, :all
      can :read, User
      can :create, User
      can :read, Album
      can :create, Album do |album|
        user.persisted?
      end
      can :read, Photo  
      can :create, Photo do |photo|
       user.persisted?
      end
      can :destroy, Album, :user_id => user.id
      can :destroy, Photo do |photo|
        photo.album.user == user
      end
      can :destroy, Comment, :user_id => user.id
      can :create, Comment do |comment| user.persisted?
      end
      can :update, Comment, :user_id => user.id
  
      can :update, User, :id => user.id
      can :vote, Photo do |photo|
        user.persisted?
      end
    end
  end
end
