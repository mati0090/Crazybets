require "spec_helper"

describe User do

  it "should show anonymous user" do
    user = User.new

    user.anonymous?.should be_true
  end

  it "should show user as not anonymous" do
    user = FactoryGirl.create(:remi)

    user.anonymous?.should be_false
  end

  it "should create user with empty balance" do
    user = FactoryGirl.create(:remi)

    user.balance.should == 0
  end
end