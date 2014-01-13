require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the CommitteesHelper. For example:
#
# describe CommitteesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
describe CommitteesHelper do
  
  describe "sign up button" do
    before {
      @shift = create(:shift)
      @signup_day = Time.local(2014, 1, 15)
    }

    context "for a senior" do
      before {
        @senior = create(:user, email: 'jzheng-14@peddie.org')
      }

      context "given a new shift" do
        it "says sign up on sign up day" do
          Timecop.freeze(@signup_day)
          expect(sign_up_button(@shift, @senior)).to match(/Sign Up/)
        end

        it "says not allowed after sign up phase" do
          Timecop.freeze(@signup_day + 100.days)
          expect(sign_up_button(@shift, @senior)).to match(/Not Allowed/)
        end

        it "says full when it's full" do
          Timecop.freeze(@signup_day)
          full_shift = create(:shift, capacity: 10, num_signups: 10)
          expect(sign_up_button(full_shift, @senior)).to match(/Full/)
        end
      end
    end

    context "for a freshman" do
      before {
        @freshman = create(:user, email: 'jzheng-17@peddie.org')
      }

      it "says not allowed before non-senior sign up day" do
        Timecop.freeze(@signup_day)
        expect(sign_up_button(@shift, @freshman)).to match(/Not Allowed/)
      end
    end

    context "for a faculty member" do
      before {
        @faculty = create(:user, email: 'faculty@peddie.org')
      }

      it "always says n/a" do
        Timecop.freeze(@signup_day)
        expect(sign_up_button(@shift, @faculty)).to match(/Not Allowed/)

        Timecop.freeze(@signup_day + 1.day)
        expect(sign_up_button(@shift, @faculty)).to match(/Not Allowed/)

        Timecop.freeze(@signup_day + 10.days)
        expect(sign_up_button(@shift, @faculty)).to match(/Not Allowed/)
      end
    end

  end

end
