class Donation < ActiveRecord::Base
  attr_accessible :amount

  belongs_to :bet
  belongs_to :user
end
