class Policy

  def self.allow_signup?(user)
    Phase.allow_signup?(user) && signup_quota_remaining(user) > 0
  end

  def self.allow_cancel?(user)
    Phase.allow_signup?(user)
  end

  def self.signup_quota_remaining(user)
    Settings.policy.students.max_shifts - user.num_signups
  end

end
