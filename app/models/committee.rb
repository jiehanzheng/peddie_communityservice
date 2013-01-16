class Committee < ActiveRecord::Base
  attr_accessible :description, :location, :name

  has_many :shifts

  validates :name, :location, :presence => true

  def total_capacity
    shifts.sum(&:capacity)
  end

  def total_available_spots
    total_capacity - shifts.inject(0) { |sum, s| sum + s.signups.count }
  end
end
