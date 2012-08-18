require "spec_helper"

describe BetsController do

  it "should be able to add bet" do
    visit new_bet_path

    fill_in "Title", :with => "Crazy thing"
    fill_in "Description", :with => "I'll do crazy thing"
    fill_in "Amount", :with => "500"

    click_on "Create Bet"

    page.should have_content("Bet was successfully created.")
    page.should have_content("Crazy thing")
    page.should have_content("I'll do crazy thing")
  end
end