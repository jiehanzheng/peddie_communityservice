require 'spec_helper'

describe Signup do
  
  it "ensures user won't sign up for same shift more than once" do
    create(:signup, user_id: 1, shift_id: 1)
    expect { create(:signup, user_id: 1, shift_id: 1) }.to raise_exception
  end

end
