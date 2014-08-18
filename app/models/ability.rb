class Ability
  include CanCan::Ability

  def initialize(user)

    can :manage, :all if user.is_admin?

    can [:update, :destroy], Book, user_id: user.id
    can [:read, :create], Book

    can :update, User, id: user.id
    can [:read, :create], User

    can [:update, :destroy], Review, user_id: user.id
    can [:read, :create], Review
    cannot :create, Review if user.is_blocked?

    can :update, Rate, id: user.id
    can [:read, :create], Rate, rater_id: user.id
    cannot :create, Rate if user.is_blocked?

  end
end
