require 'spec_helper'

feature "Counting mechanism" do
  fixtures :users, :committees, :shifts

  before do
    Timecop.freeze Time.new(2013,1,22,0,0,1)
  end

  after do
    Timecop.return
  end

  it "should display N/A links to users who already has two shifts" do
    login_as 'senior'
    visit '/signups/new?shift_id=1'
    click_on 'Confirm signup'
    visit '/signups/new?shift_id=2'
    click_on 'Confirm signup'

    visit root_path
    click_on 'Clothing Drive'
    page.should have_content 'N/A'
  end

  it "disallows user who already has two shifts to sign up for more" do
    login_as 'senior'
    visit '/signups/new?shift_id=1'
    click_on 'Confirm signup'
    visit '/signups/new?shift_id=2'
    click_on 'Confirm signup'
    
    visit '/signups/new?shift_id=3'
    click_on 'Confirm signup'
    page.should have_content 'User has already used up his/her signup quota'
  end
end