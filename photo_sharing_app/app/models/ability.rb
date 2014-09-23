class Ability
  include CanCan::Ability


  def initialize(user)
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
   can :destroy, Photo, :user_id => user.id
   can :destroy, Comment, :user_id => user.id
   can :edit, Comment, :user_id => user.id
   can :destroy, Tag, :user_id => user.id
   can :edit, Tag, :user_id => user.id
 end
end
end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  

