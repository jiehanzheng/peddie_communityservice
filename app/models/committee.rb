class Committee < ActiveRecord::Base
  has_many :shifts

  def num_signups
    shifts.to_a.sum(&:num_signups)
  end

  def capacity
    shifts.to_a.sum(&:capacity)
  end

  def spots
    shifts.to_a.sum(&:spots)
  end
end
