class Ability
  include CanCan::Ability

  def initialize(user)

    can :manage, :all if user.is_admin?
    can [:update, :destroy], Book, user_id: user.id
    can [:read, :create], Book
    can [:update, :destroy], User if user.is_admin?
    can :update, User, id: user.id
    can [:read, :create], User

  end
end
