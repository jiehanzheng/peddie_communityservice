class Signup < ActiveRecord::Base
  belongs_to :shift
  belongs_to :user

  validates_associated :shift, :user

  def save_and_update_counts!
    transaction do
      shift.lock!
      if !shift.has_spots?
        raise "This shift is full."
      end

      user.lock!
      if !Policy.allow_signup?(user)
        raise "You may not sign up today, or have reached maximum number of shifts."
      end

      save!
      user.increment!(:num_signups)
      shift.increment!(:num_signups)
    end
  end

  def destroy_and_update_counts!
    transaction do
      shift.lock!

      user.lock!
      if !Policy.allow_cancel?(user)
        raise "You may not cancel today."
      end

      destroy!
      user.decrement!(:num_signups)
      shift.decrement!(:num_signups)
    end
  end
end
