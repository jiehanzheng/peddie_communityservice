require 'spec_helper'

describe Committee do
  context "with two shifts" do
    before {
      @committee = create(:committee)
      @shift1 = create(:shift, num_signups: rand(50), capacity: 50 + rand(100), committee: @committee)
      @shift2 = create(:shift, num_signups: rand(50), capacity: 50 + rand(100), committee: @committee)
    }

    it "adds up signups in children" do
      expect(@committee.num_signups).to eq(@shift1.num_signups + @shift2.num_signups)
    end

    it "adds up capacity in children" do
      expect(@committee.capacity).to eq(@shift1.capacity + @shift2.capacity)
    end

    it "calculates remaining spots" do
      expect(@committee.spots).to eq((@shift1.capacity + @shift2.capacity) - (@shift1.num_signups + @shift2.num_signups))
    end
  end
end
