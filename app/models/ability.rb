  class Ability
    include CanCan::Ability
    def initialize(user)
      user ||= User.new
      if (user.has_role? :super_admin)
        can :manage, :all
      elsif (user.has_role? :admin)
        can [:create,:destroy,:update,:read],[Maintainance]
        cannot [:create, :destroy, :index], [Society]
        can [:create,:destroy],[Message]
        can [:send_mail,:change_password_edit,:change_password_update],[User]
        cannot [:index],[Message]
        can [:edit,:add],[Society]
        can [:edit,:update],[User]
        can [:create, :destroy, :update], [Event]
        can [:show],[User]
        can [:index],[Complaint]
        can [:create],[Notification]
        
      else
       
       cannot [:create,:destroy,:update,:index],[Maintainance]
       cannot [:create, :destroy, :update], [Society, Event]
       can [:add],[Society]
       can [:create,:destroy],[Message]
       cannot [:index],[Message]
       cannot [:show],[User]
       can [:edit,:update],[User]
       can [:change_password_edit,:change_password_update],[User]
       can [:create],[Complaint]
       cannot [:index],[Complaint]
     end
      # Define abilities for the passed in user here. For example:
      #
      #   user ||= User.new # guest user (not logged in)
      #   if user.admin?
      #     can :manage, :all
      #   else
      #     can :read, :all
      #   end
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
    end
  end
