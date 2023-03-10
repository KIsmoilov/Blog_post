class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, Post

    return unless user.present?

    can :manage, Post, author_id: user.id
    can :manage, Comment, author_id: user.id
    can :manage, Like, author_id: user.id
    return unless user.admin?

    can :manage, :all
  end
end
