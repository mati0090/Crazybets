class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    alias_action :index, :show, :to => :read
    alias_action :new,          :to => :create
    alias_action :edit,         :to => :update
    alias_action :destroy,      :to => :delete

    can :read, Bet

    can :create, Bet do
      !user.anonymous?
    end

    can :update, Bet do |bet|
      !user.anonymous? && bet.author == user
    end
  end
end
