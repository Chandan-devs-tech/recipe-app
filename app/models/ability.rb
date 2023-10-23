class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all
    can :manage, Recipe, { author: user }
  end
end
