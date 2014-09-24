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
        User.find(Album.find(photo.album_id).user_id) == user
      end
      can :destroy, Comment, :user_id => user.id
      can :edit, Comment, :user_id => user.id
<<<<<<< HEAD
      can :destroy, Tag, :user_id => user.id
      can :edit, Tag, :user_id => user.id
=======
>>>>>>> CoverPhoto
      can :edit, User, :id => user.id
      can :vote, Photo do |photo|
        user.persisted?
      end

<<<<<<< HEAD
   user ||= User.new 
   if user.role? :admin
     can :manage, :all
   else
     can :manage, :all
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
      User.find(Album.find(photo.album_id).user_id) == user
    end
    can :destroy, Comment, :user_id => user.id
    can :edit, Comment, :user_id => user.id
    can :destroy, Tag, :user_id => user.id
    can :edit, Tag, :user_id => user.id
    can :edit, User, :id => user.id

=======
>>>>>>> CoverPhoto
    end
  end
end

