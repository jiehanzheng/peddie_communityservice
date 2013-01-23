class User < ActiveRecord::Base
  validates :provider, :uid, :first_name, :last_name, :school_role, :presence => true

  def self.from_omniauth(auth)
    user = where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
    
    begin
      user = update_from_omniauth(auth, user)
      user.save!
    rescue
      raise "Failure updating your record in users table."
    end

    user
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]

      user = update_from_omniauth(auth, user)
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def can_signup?
    if eligible_today? and signup_quota_remaining > 0
      true
    else
      false
    end
  end

  def can_cancel?
    eligible_today?
  end

  def signed_up?(shift)
    shift.signups.each do |signup|
      if signup.user == self
        return signup
      end
    end

    false
  end

  def eligible_today?
    if not graduation_year.blank? and Phase.details[:graduation_years].include?(Integer(graduation_year))
      return true
    end

    false
  end

  def signup_count
    Signup.where(:user_id => id).count
  end

  def signup_quota_remaining
    Settings.policy.students.max_shifts - Signup.where(:user_id => id).count
  end

  def role_symbols
    role_symbols = Array.new

    unless site_role.blank?
      role_symbols << site_role.to_sym
    end

    unless school_role.blank?
      role_symbols << ('school_' + school_role).to_sym
    end
  end


  private

  def self.update_from_omniauth(auth, user)
    if 'peddie' == auth["provider"]
      user.first_name = auth["info"]["first_name"]
      user.last_name = auth["info"]["last_name"]

      unless auth["info"]["email"] =~ /^(?:[a-z\-]+)(?:-(\d{2}))?@peddie\.org$/
        raise "You need to login with your Peddie Email account."
      end

      user.email = auth["info"]["email"]

      if $1.blank?
        user.school_role = 'faculty'
      else
        user.school_role = 'student'
        user.graduation_year = $1
      end
    elsif 'identity' == auth["provider"]
      user.site_role = 'admin'
    end

    user.site_role ||= 'user'

    user
  end

end
