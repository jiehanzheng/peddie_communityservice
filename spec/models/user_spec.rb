require 'spec_helper'

describe User do

  it "accepts Peddie email addresses" do
    expect(User.is_peddie_email("username-with-many-dashes-14@peddie.org")).to be true
  end

  it "accepts Peddie faculty emails" do
    expect(User.is_peddie_email("faculty-member@peddie.org")).to be true
  end

  it "rejects non-Peddie emails" do
    expect(User.is_peddie_email("bad-guy-out-there@blair.edu")).to be false
  end

  describe "OmniAuth authentication" do
    before {
      @legit_peddie_kid_auth_hash = { :provider => 'peddie',
                                      :uid      => 'some_uid',
                                      :info     => { :first_name => 'John',
                                                     :last_name  => 'Doe',
                                                     :email      => 'jdoe-14@peddie.org' } }

      @poor_blair_kid_auth_hash = { :provider => 'peddie',
                                    :uid      => 'some_other_uid',
                                    :info     => { :first_name => 'Lame',
                                                   :last_name  => 'Person',
                                                   :email      => 'lame@blair.edu' } }
    }

    it "allows a Peddie student to sign up and sign in" do
      peddie_user = User.from_auth_hash(@legit_peddie_kid_auth_hash)
      expect(peddie_user).to be_an_instance_of(User)
    end

    it "rejects Blair kids because they couldn't get in Peddie" do
      expect {
        User.from_auth_hash(@poor_blair_kid_auth_hash)
        }.to raise_error('You have to sign in with a valid Peddie School email address.')
    end

  end

  context "who is a Peddie student of Class of 2014" do
    before {
      @user = create(:user, first_name: "John", last_name: "Doe", email: "jdoe-14@peddie.org")
    }

    it "extracts graduation year" do
      expect(@user.graduation_year).to equal(14)
    end

    it "counts signups" do
      total_signups = rand(10)
      shifts = create_list(:shift, total_signups)

      shifts.each do |shift|
        create(:signup, user: @user, shift: shift)
      end

      expect(@user.signups.count).to equal(total_signups)
    end

    it "can give full name" do
      expect(@user.full_name).to eq("John Doe")
    end

    it "knows that he is a student" do
      expect(@user.is_student?).to be true
    end

  end

end
