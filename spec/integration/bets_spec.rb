require "spec_helper"

describe BetsController do

  it "should be unable to add bet without login" do
    visit new_bet_path

    current_path.should == new_login_path
  end

  describe "Creating bet" do
    before(:each) do
      create_users :remi
      login(@remi)

      visit new_bet_path

      fill_in "Title", :with => "Crazy thing"
      fill_in "Description", :with => "I'll do crazy thing"
      fill_in "Amount", :with => "500"

      click_on "Create Bet"
    end

    it "should be able to add bet" do
      page.should have_content("Bet was successfully created.")
      page.should have_content("Crazy thing")
      page.should have_content("I'll do crazy thing")
    end

    it "should list only bets belongs to users" do
      FactoryGirl.create(:bet, :title => "Jump form 100m bridge")
      visit profile_bets_path(@remi)

      page.should     have_content("Crazy thing")
      page.should_not have_content("Jump form 100m bridge")
    end

    it "should list all bets on home page" do
      FactoryGirl.create(:bet, :title => "Jump form 100m bridge")
      visit root_path

      page.should have_content("Crazy thing")
      page.should have_content("Jump form 100m bridge")
    end
  end
end