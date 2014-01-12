class Shift < ActiveRecord::Base
  belongs_to :committee
  has_many :signups

  def spots
    capacity - num_signups
  end

  def has_spots?
    spots >= 1
  end

  def signup_by_user(user)
    signups.find_by(user: user)
  end

  Time::DATE_FORMATS[:time_only] = "%I:%M %p"
  
  def friendly_start_time
    start_time.to_s :time_only
  end

  def friendly_end_time
    end_time.to_s :time_only
  end

end
