require "spec_helper"
 
module HelperMethods

  def logout_user()
    Capybara.reset_sessions!
  end
   
  def login_as(uid)
    logout_user
    visit cheating_login_page_path
    fill_in :uid, :with => uid
    click_button "Save changes"
  end

end