require "spec_helper"

describe UsersController do

  it "should be able to create account and login" do
    visit new_account_path
    fill_in 'Login', :with => 'Bury'
    fill_in 'Email', :with => 'bury@example.com'
    fill_in 'Password', :with => 'pass123'
    fill_in 'Password confirmation', :with => 'pass123'
    click_button("Register")

    page.should have_content("Account registered!")
  end

  it "should be able to login" do
    User.create!(:login => 'Bury',
                :password => 'pass123',
                :password_confirmation => 'pass123',
                :email => 'bury@example.com')

    visit new_login_path
    fill_in 'Login',    :with => 'Bury'
    fill_in 'Password', :with => 'pass123'
    click_button("Login")

    page.should have_content("Login successful!")
  end
end