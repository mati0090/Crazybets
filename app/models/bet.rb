class Bet < ActiveRecord::Base
  attr_accessible :amount, :description, :title, :author

  belongs_to :author, :class_name => "User"
end
