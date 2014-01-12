require "spec_helper"

feature "Peddie OpenID" do
  scenario "user signs in/out" do
    visit '/'
    click_link "Sign in"
    expect(page).to have_content "You have signed in as"

    click_link "Sign out"
    expect(page).to have_content "Signed out successfully."
  end

end