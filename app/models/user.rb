class User < ActiveRecord::Base
  has_many :signups

  def self.from_auth_hash(auth_hash)
    auth_hash = auth_hash.with_indifferent_access

    user = where(auth_hash.slice("provider", "uid")).first || create_from_auth_hash(auth_hash)

    begin
      update_user_with_auth_hash(auth_hash, user)
      user.save!
    rescue => detail
      raise "We are unable to save your information to user table: " + detail.message
    end

    user
  end

  def self.create_from_auth_hash(auth_hash)
    create! do |user|
      user.provider = auth_hash[:provider]
      user.uid = auth_hash[:uid]

      if user.provider == 'peddie' && !is_peddie_email(auth_hash[:info][:email])
        raise "You have to sign in with a valid Peddie School email address."
      end

      update_user_with_auth_hash(auth_hash, user)
    end
  end

  def self.is_peddie_email(email_address)
    if email_address =~ /^(?:[a-z\-]+)(?:-(\d{2}))?@peddie\.org$/
      true
    else
      false
    end
  end

  def graduation_year
    if email =~ /^(?:[a-z\-]+)(?:-(\d{2}))?@peddie\.org$/
      $1.to_i
    else
      nil
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def is_student?
    graduation_year != nil
  end
  

  private

  def self.update_user_with_auth_hash(auth_hash, user)
    if auth_hash[:provider] != 'peddie'
      return
    end

    user.first_name = auth_hash[:info][:first_name]
    user.last_name  = auth_hash[:info][:last_name]
    user.email      = auth_hash[:info][:email]
  end

end
