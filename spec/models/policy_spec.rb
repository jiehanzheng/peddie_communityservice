require 'spec_helper'

describe Policy do
  
  context "with an eligible senior who hasn't signed up yet" do
    before {
      Timecop.freeze(Time.local(2014, 1, 16))
      @user = create(:user, email: 'jzheng-14@peddie.org', num_signups: 0)
    }

    it "allows signup" do
      expect(Policy.allow_signup?(@user)).to be true
    end
  end

  context "with an eligible senior who has already signed up two shifts" do
    before {
      Timecop.freeze(Time.local(2014, 1, 16))
      @user = create(:user, email: 'jzheng-14@peddie.org', num_signups: 2)
    }

    it "allows signup" do
      expect(Policy.allow_signup?(@user)).to be false
    end

    it "allows cancel" do
      expect(Policy.allow_cancel?(@user)).to be true
    end
  end

  context "on senior signup day, with a junior who has not signed up yet" do
    before {
      Timecop.freeze(Time.local(2014, 1, 15))
      @user = create(:user, email: 'jzheng-15@peddie.org', num_signups: 0)
    }

    it "allows signup" do
      expect(Policy.allow_signup?(@user)).to be false
    end
  end

end
