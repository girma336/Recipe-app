class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    # return unless user.present?
    # can :read, :all
    # can [:destroy, :create, :update], Recipe, user_id: :current_user.id
    # return unless user.admin?
    # can :manage, :all

    # if user is not logged in
    user ||= User.new
    # allow everyone to read public recipes
    can :read, Recipe, public: true
    can :read, :all
    if user.admin?
      can :manage, :all
    else
      can :manage, Recipe, user_id: user.id
      can :manage, RecipeFood
      can :manage, Food, user_id: user.id
      can :manage, Inventory, user_id: user.id
      can :manage, InventoryFood, user_id: user.id
      can :read, :all
      # can :create, Food, recipe: { user_id: user.id }
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
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end
