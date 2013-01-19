require 'spec_helper'

feature "Counting mechanism" do
  fixtures :users, :committees, :shifts

  it "should notify users who already has two shifts to sign up for more" do
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
    page.should have_content 'User is not allowed to sign up today'
  end
end