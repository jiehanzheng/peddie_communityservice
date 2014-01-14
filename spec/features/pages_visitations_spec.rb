require 'spec_helper'

describe "Pages visitation" do

  before(:each) {
    OmniAuth.config.test_mode = true
    load "#{Rails.root}/db/seeds.rb"
  }

  after(:each) {
    OmniAuth.config.test_mode = false
  }
  
  context "given a faculty member" do
    before(:each) {
      OmniAuth.config.mock_auth[:peddie] = OmniAuth::AuthHash.new({
        :provider => 'peddie',
        :uid => 'some_test_uid_faculty',
        :info     => { :first_name => 'John',
                       :last_name  => 'Doe',
                       :email      => 'faculty@peddie.org' }
      })
    }

    it "should render all homepage and committee pages without errors" do
      visit '/'
      within 'nav' do
        click_link 'Sign in'
      end

      all_committees_links = all('#committees a')
      expect(all_committees_links.count).to be > 0
      all_committees_links.each { |a| a.click }
    end
  end

  context "given a student" do
    before(:each) {
      OmniAuth.config.mock_auth[:peddie] = OmniAuth::AuthHash.new({
        :provider => 'peddie',
        :uid => 'some_test_uid_student',
        :info     => { :first_name => 'John',
                       :last_name  => 'Doe',
                       :email      => 'student-14@peddie.org' }
      })
    }

    it "should render all homepage and committee pages without errors" do
      visit '/'
      within 'nav' do
        click_link 'Sign in'
      end

      all_committees_links = all('#committees a')
      expect(all_committees_links.count).to be > 0
      all_committees_links.each { |a| a.click }
    end
  end

end
