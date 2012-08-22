class Bet < ActiveRecord::Base
  attr_accessible :amount, :description, :title, :user_id, :user

  belongs_to :user
end
