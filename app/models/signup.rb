class Signup < ActiveRecord::Base
  attr_accessible :shift_id

  belongs_to :shift
  belongs_to :user

  validates :user_id, :presence => true
  validates_associated :user
  validates :shift_id, :uniqueness => { :scope => :user_id,
                                        :message => "should not belong to the same user twice" }
  validate :signup_checks
  before_destroy :cancel_checks


  private

  def signup_checks
    unless shift.has_spots?
      errors.add(:shift, "has no spots for you now")
    end

    unless user.eligible_today?
      errors.add(:user, "is not allowed to sign up today")
    end

    unless user.signup_quota_remaining > 0
      errors.add(:user, "has already used up his/her signup quota")
    end
  end

  def cancel_checks
    unless user.eligible_today?
      errors.add(:user, "is not allowed to sign up today")
      return false
    end
  end
end
