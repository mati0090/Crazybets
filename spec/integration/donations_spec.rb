require "spec_helper"

describe DonationsController do

  it "should be unable to donate as guest user" do
    bet = FactoryGirl.create(:bet)
    visit bet_path(bet)
    click_link("Donate")

    page.should have_content("You must be logged in to access this page")
  end

  it "should able to donate as logged user" do
    bet = FactoryGirl.create(:bet)
    create_users :remi
    login(@remi)

    visit bet_path(bet)
    click_link("Donate")

    fill_in "Amount", :with => 50
    click_button("Donate")

    page.should have_content('You have donated bet "Jump form 100m bridge."')
  end
end