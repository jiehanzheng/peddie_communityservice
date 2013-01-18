# use Timecop

require 'spec_helper'

feature "Time restriction (before it starts)" do
  fixtures :users, :committees, :shifts

  before do
    Timecop.freeze Time.new(1994,12,12)
  end

  after do
    Timecop.return
  end

  it "shows juniors a notice on the page" do
    login_as 'junior'
    visit root_path
    page.should have_content 'not eligible'
  end

  it "disallows juniors to sign up" do
    login_as 'junior'
    visit root_path
    click_link 'Meals on Wheels'
    page.should have_content 'N/A'

    visit '/signups/new?shift_id=2'
    click_on 'Confirm signup'
    page.should have_content 'User is not allowed to sign up today'
  end

  it "disallows seniors to sign up" do
    login_as 'senior'
    visit root_path
    click_link 'Meals on Wheels'
    page.should have_content 'N/A'

    visit '/signups/new?shift_id=2'
    click_on 'Confirm signup'
    page.should have_content 'User is not allowed to sign up today'
  end
end


feature "Time restriction (on the first day)" do
  fixtures :users, :committees, :shifts

  before do
    Timecop.freeze Time.new(2013,1,21,0,0,1)
  end

  after do
    Timecop.return
  end

  it "shows juniors a notice on the page" do
    login_as 'junior'
    visit root_path
    page.should have_content 'not eligible'
  end

  it "allows juniors to sign up" do
    login_as 'junior'
    visit root_path
    click_link 'Meals on Wheels'
    page.should have_content 'N/A'

    visit '/signups/new?shift_id=2'
    click_on 'Confirm signup'
    page.should have_content 'User is not allowed to sign up today'
  end

  it "allows seniors to sign up and cancel" do
    login_as 'senior'
    visit root_path
    click_link 'Meals on Wheels'
    page.should_not have_content 'N/A'

    click_on 'Sign up'
    click_on 'Confirm signup'
    page.should_not have_content 'User is not allowed to sign up today'
    page.should have_content 'Isreal Almsteadt you'

    click_on 'Cancel'
    page.should_not have_content 'Isreal Almsteadt you'
  end
end


feature "Time restriction (on the second day)" do
  fixtures :users, :committees, :shifts

  before do
    Timecop.freeze Time.new(2013,1,22,0,0,1)
  end

  after do
    Timecop.return
  end

  it "shows juniors a notice on the page" do
    login_as 'junior'
    visit root_path
    page.should have_content 'You are eligible'

  end

  it "allows juniors to sign up and cancel" do
    login_as 'junior'
    visit root_path
    click_link 'Meals on Wheels'
    page.should_not have_content 'N/A'

    click_on 'Sign up'
    click_on 'Confirm signup'
    page.should_not have_content 'User is not allowed to sign up today'
    page.should have_content 'Garret Abramoff you'

    click_on 'Cancel'
    page.should_not have_content 'Garret Abramoff you'
  end

  it "allows seniors to sign up and cancel" do
    login_as 'senior'
    visit root_path
    click_link 'Meals on Wheels'
    page.should_not have_content 'N/A'

    click_on 'Sign up'
    click_on 'Confirm signup'
    page.should_not have_content 'User is not allowed to sign up today'
    page.should have_content 'Isreal Almsteadt you'

    click_on 'Cancel'
    page.should_not have_content 'Isreal Almsteadt you'
  end
end


feature "Time restriction (freeze phase)" do
  fixtures :users, :committees, :shifts

  before do
    @everyone_time = Time.new(2013,1,22,0,0,1)
    @freeze_time = Time.new(2013,1,31,0,0,1)
    Timecop.freeze @freeze_time
  end

  after do
    Timecop.return
  end

  it "shows juniors a notice on the page" do
    login_as 'junior'
    visit root_path
    page.should have_content 'not eligible'

  end

  it "disallows juniors to sign up" do
    login_as 'junior'
    visit root_path
    click_link 'Meals on Wheels'
    page.should have_content 'N/A'

    visit '/signups/new?shift_id=2'
    click_on 'Confirm signup'
    page.should have_content 'User is not allowed to sign up today'
  end

  it "disallows seniors to sign up" do
    login_as 'senior'
    visit root_path
    click_link 'Meals on Wheels'
    page.should have_content 'N/A'

    visit '/signups/new?shift_id=2'
    click_on 'Confirm signup'
    page.should have_content 'User is not allowed to sign up today'
  end

  it "disallows anyone to cancel previously created signups" do
    login_as 'junior'
    visit root_path

    Timecop.freeze @everyone_time

    click_link 'Meals on Wheels'
    page.should_not have_content 'N/A'

    click_on 'Sign up'
    click_on 'Confirm signup'
    page.should_not have_content 'User is not allowed to sign up today'
    page.should have_content 'Garret Abramoff you'

    Timecop.freeze @freeze_time

    click_on 'Cancel'
    page.should have_content 'Garret Abramoff you'
  end
end