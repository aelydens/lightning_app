require 'rails_helper'
require 'capybara/rails'

feature 'Auth' do

  scenario 'Users can login and out' do
    User.create!(email: "user@example.com", password: "test")

    visit root_path
    click_on "Sign In"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "test"
    within("form") { click_on "Sign In" }
    expect(page).to have_content("user@example.com")
  end

  scenario 'Users can register' do
    visit sign_up_path
    fill_in "Name", with: "Annie Test"
    fill_in "Email", with: "aelydens@test.com"
    fill_in "Password", with: "password"
    within("form") { click_on "Sign Up" }

    expect(page).to have_content("aelydens@test.com")
  end
end
