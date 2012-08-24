require "spec_helper"

describe Donation do

  it "should be unable to donate more than balance" do
    user = FactoryGirl.create(:remi)
    bet = FactoryGirl.create(:bet)

    donation = Donation.new
    donation.amount = 100
    donation.user = user
    donation.bet = bet

    donation.valid?.should be_false
    donation.errors[:amount].should include("You don't have enough credits.")
  end

  it "should be able to donate if have credits" do
    user = FactoryGirl.create(:remi, :balance => 101)
    bet = FactoryGirl.create(:bet)

    donation = Donation.new
    donation.amount = 100
    donation.user = user
    donation.bet = bet

    donation.errors[:amount].should be_empty
  end
end