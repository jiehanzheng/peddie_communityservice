require 'spec_helper'

describe SignupsController do
  context "with two users and some signups" do
    before {
      Timecop.freeze(Time.local(2014, 1, 15))

      @user = create(:user, email: 'jzheng-14@peddie.org', num_signups: 0)
      @other_user = create(:user)
      @other_can_signup_user = create(:user, email: 'jzheng-14@peddie.org', num_signups: 0)

      @committee = create(:committee)
      @shift = create(:shift, committee: @committee, capacity: 50, num_signups: 0)
      @signup = create(:signup, shift: @shift, user: @user)
    }

    it "allows user to sign up" do
      allow(controller).to receive(:current_user).and_return(@other_can_signup_user)
      post :create, :signup => {:shift_id => @shift.id}
      expect(response).to redirect_to(@committee)
      expect(flash[:success]).to eq('You have signed up successfully!')
    end

    it "allows the user to cancel his/her own signups" do
      allow(controller).to receive(:current_user).and_return(@user)
      delete :destroy, id: @signup.id
      expect(response).to redirect_to(@committee)
      expect(flash[:notice]).to eq('We&rsquo;ve removed you from the list.')
    end

    it "disallows other user to cancel @user's signups" do
      allow(controller).to receive(:current_user).and_return(@other_user)
      delete :destroy, id: @signup.id
      expect(response).to redirect_to(@committee)
      expect(flash[:error]).to eq("You cannot cancel shifts for others!")
    end

    it "disallows guests to cancel signups" do
      delete :destroy, id: @signup.id
      expect(response).to redirect_to(root_path)
    end
  end
end
