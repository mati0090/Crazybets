require "spec_helper"

describe Bet do

  it "should be able to create bet" do
    bet = Bet.new
    bet.title = "Something crazy"
    bet.description ="I'll do something crazy"
    bet.amount = 500

    bet.save.should be_true
  end

end