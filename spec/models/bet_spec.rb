require "spec_helper"

describe Bet do

  it "should be able to create bet" do
    user = FactoryGirl.create(:remi)

    bet = Bet.new
    bet.title = "Something crazy"
    bet.description ="I'll do something crazy"
    bet.amount = 500
    bet.author = user

    bet.save.should be_true
  end

end