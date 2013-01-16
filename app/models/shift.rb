class Shift < ActiveRecord::Base
  attr_accessible :committee_id, :position, :capacity, :end_time, :start_time

  belongs_to :committee
  has_many :signups

  validates_associated :committee
  validates :position, :numericality => true
  validates :capacity, :numericality => true
  validates :start_time, :presence => true
  validates :end_time, :presence => true


  Time::DATE_FORMATS[:peddie_friendly_time] = "%I:%M %p"

  def start_time_human
    start_time.to_s :peddie_friendly_time
  end

  def end_time_human
    end_time.to_s :peddie_friendly_time
  end

  def has_spots?
    (capacity - signups.count) > 0 ? true : false
  end

end
