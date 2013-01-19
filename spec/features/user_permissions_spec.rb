require 'spec_helper'

feature "Guest users" do
  fixtures :users, :committees, :shifts

  it "should be able to view the home page" do
    visit root_path
    page.should have_content 'Meals on Wheels'
  end

  it "should be able to sign in" do
    login_as 'junior'
    page.should have_content 'signed in via'
  end
end


feature "Juniors" do
  fixtures :users, :committees, :shifts
  before(:each) { login_as 'junior' }

  it "should be able to view the home page" do
    visit root_path
    page.should have_content 'Meals on Wheels'
  end

  it "should be able to click on committees" do
    visit root_path
    click_link 'Meals on Wheels'
    page.should have_content 'Details'
  end

  it "should be able to see his/her signups" do
    login_as 'junior'
    visit signups_path
    page.should_not have_content 'Meals on Wheels'
  end

  it "should not be able to see other's signups" do
    login_as 'junior'
    visit signups_path
    page.should_not have_content 'Bag Lunches'
  end
end


feature "Faculty members" do
  fixtures :users, :committees, :shifts
  before(:each) { login_as 'faculty' }

  it "should be able to view the home page" do
    visit root_path
    page.should have_content 'Meals on Wheels'
  end

  it "should be able to click on committees" do
    visit root_path
    click_link 'Meals on Wheels'
    page.should have_content 'Details'
  end

end