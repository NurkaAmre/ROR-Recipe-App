# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :destroy, Recipe, user:user
  end
end
