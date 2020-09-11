require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  background :each do
    visit new_user_path
  end

  scenario 'has a new user page' do 
    expect(page).to have_content("Sign up")
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
        fill_in "Username", with: "user123"
        fill_in "Email", with: "user123@aa.io"
        fill_in "Password", with: "password"

        click_button "Sign Up"
        expect(page).to have_content("user123")

        # to check if the submit button takes us to show page:
        # user = User.find_by(username: "user123")
        # expect(current_path).to eq(user_path(user))

    end

  end
end

# feature 'logging in' do
#   scenario 'shows username on the homepage after login'

# end

# feature 'logging out' do
#   scenario 'begins with a logged out state'

#   scenario 'doesn\'t show username on the homepage after logout'

# end