# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    can :create, Post
    #can :read, Post, public: true

    if user.present?  # additional permissions for logged in users (they can read their own posts)

      if user.admin?
        can :manage, :all
      else

        #can :read, Post, user_id: user.id
        #can :edit, Post, user_id: user.id
        #can :update, Post, user_id: user.id
        #can :destroy, Post, user_id: user.id

        bool_user = false
        bool_location = false
        class_name = ""
        count = 0

        user.role.permissions.each do |permission|

          tmp_class_name = permission.subject_class

          if class_name != tmp_class_name
            class_name = tmp_class_name
            bool_user = false
            bool_location = false
          else
          end

          if permission.action == "user"
            bool_user = true
          end

          if permission.action == "location"
            bool_location = true
          end

          if ['read', 'edit', 'update', 'destroy'].include? permission.action
            if bool_user
              can permission.action.to_sym, permission.subject_class.constantize, user_id: user.id
            else
              can permission.action.to_sym, permission.subject_class.constantize
            end

          end
          #puts permission.to_json
        end

        #can [:update, :destroy, :edit, :read], Post do |post|
        #  post.user_id == user.id
        #end

        #can :read, :all
      end

      #if user.admin?  # additional permissions for administrators
      #  can :read, Post
      #end
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
