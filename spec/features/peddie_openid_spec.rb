require "spec_helper"

feature "Peddie OpenID" do

  before(:each) {
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:peddie] = OmniAuth::AuthHash.new({
      :provider => 'peddie',
      :uid => 'some_test_uid_student',
      :info     => { :first_name => 'John',
                     :last_name  => 'Doe',
                     :email      => 'student-14@peddie.org' }
    })
  }

  after(:each) {
    OmniAuth.config.test_mode = false
  }

  scenario "user signs in/out" do
    visit '/'
    click_link "Sign in"
    expect(page).to have_content "You have signed in as"

    click_link "Sign out"
    expect(page).to have_content "Signed out successfully."
  end

end