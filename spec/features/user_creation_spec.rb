require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'

describe 'creating an account, logging in and logging out' do

  it 'creates a new user' do
    visit new_user_path

    fill_in "Username", with: "Iaj"
    fill_in "Password", with: "123"
    click_button "Create Account"

    expect(page).to have_content("Welcome Iaj")

  end

  it 'allows a user to login' do
    user = User.create(username: "Jai", password: "123")

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: "123"
    click_button "Login"

    within(".flash_message") do
      expect(page).to have_content("Welcome Jai")
    end

  end

  xit 'allows a user to logout' do
    user = User.create(username: "L", password: "Sweden")

    visit login_path

    fill_in "Username", with: user.username
    fill_in "Password", with: "Sweden"
    click_button "Login"
    save_and_open_page

    within(".flash_message") do
      expect(page).to have_content("Welcome L")
    end

    click_link "Logout"
    save_and_open_page
    # within(".flash_message") do
    #
    expect(page).to_not have_content("Welcome L")
    expect(page).to have_content("logged out")
    # end

  end

end
