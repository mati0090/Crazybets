class Donation < ActiveRecord::Base
  belongs_to :bet
  belongs_to :user

  attr_accessible :amount

  validates :amount, :numericality => {:only_integer => true, :greater_than => 0}
  validate :amount_validator

  private
    def amount_validator
      if self.amount > user.balance
        errors.add(:amount, "You don't have enough credits.")
      end
    end
end
