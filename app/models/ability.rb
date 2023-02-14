class Ability
  include CanCan::Ability

  def initialize(user)
    can :destroy, Recipe, user:
  end
end
