require 'spec_helper'

describe Phase do
  
  context "before 1/15/2014" do
    before {
      Timecop.freeze(Time.local(2014, 1, 14))
    }

    it "says no one can sign up" do
      expect(Phase.allowed_graduation_years).to be_empty
    end
  end

  context "on 1/15/2014" do
    before {
      Timecop.freeze(Time.local(2014, 1, 15))
    }

    it "says only seniors can sign up" do
      expect(Phase.allowed_graduation_years).to match_array([14])
    end

    it "allows seniors to sign up" do
      user = create(:user, email: 'jzheng-14@peddie.org')
      expect(Phase.allow_signup?(user)).to be true
    end

    it "disallows juniors to sign up" do
      user = create(:user, email: 'jzheng-15@peddie.org')
      expect(Phase.allow_signup?(user)).to be false
    end

    it "allows special users to sign up" do
      user = create(:user, email: 'ajones-twaddell-16@peddie.org')
      expect(Phase.allow_signup?(user)).to be true
    end
  end

  context "on 1/16/2014" do
    before {
      Timecop.freeze(Time.local(2014, 1, 16))
    }

    it "says everyone can sign up" do
      expect(Phase.allowed_graduation_years).to match_array([14, 15, 16, 17])
    end

    it "allows seniors to sign up" do
      user = create(:user, email: 'jzheng-14@peddie.org')
      expect(Phase.allow_signup?(user)).to be true
    end

    it "allows underclassmen to sign up" do
      user = create(:user, email: 'jdoe-16@peddie.org')
      expect(Phase.allow_signup?(user)).to be true
    end
  end

  context "after 1/20/2014" do
    before {
      Timecop.freeze(Time.local(2014, 1, 20))
    }

    it "says no one can sign up" do
      expect(Phase.allowed_graduation_years).to be_empty
    end
  end

end
