class User < ActiveRecord::Base
  acts_as_authentic
  attr_accessible :login, :email, :password, :password_confirmation

  has_many :bets

  def anonymous?
    new_record?
  end
end
