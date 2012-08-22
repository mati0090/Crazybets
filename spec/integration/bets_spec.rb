require "spec_helper"

describe BetsController do

  it "should be able to add bet" do
    create_users :remi
    login(@remi)

    visit new_bet_path

    fill_in "Title", :with => "Crazy thing"
    fill_in "Description", :with => "I'll do crazy thing"
    fill_in "Amount", :with => "500"

    click_on "Create Bet"

    page.should have_content("Bet was successfully created.")
    page.should have_content("Crazy thing")
    page.should have_content("I'll do crazy thing")
  end

  it "should be unable to add bet without login" do
    visit new_bet_path

    current_path.should == new_login_path
  end
end