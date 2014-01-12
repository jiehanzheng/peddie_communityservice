require 'spec_helper'

describe Shift do
  context "about one shift" do
    before {
      @shift = create(:shift, num_signups: rand(50), capacity: 50 + rand(100))
    }

    it "calculates remaining spots" do
      expect(@shift.spots).to eq(@shift.capacity - @shift.num_signups)
    end
  end

  context "with one shift and many signups" do
    before {
      @shift = create(:shift, capacity: 50 + rand(100))
     
      @user = create(:user)
      @signup = create(:signup, user: @user, shift: @shift)
     
      @other_user = create(:user)
      @other_signup = create(:signup, user: @other_user, shift: @shift)
    }

    it "finds users' signup" do
      expect(@shift.signup_by_user(@user)).to eq @signup
      expect(@shift.signup_by_user(@other_user)).to eq @other_signup
    end
  end

end
