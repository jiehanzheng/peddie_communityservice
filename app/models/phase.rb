class Phase

  def self.current
    phases = Hash.try_convert(Settings.phases).with_indifferent_access

    phases.each do |phase|
      phase_name = phase[0].to_s
      phase_details = phase[1]

      start_date = phase_details[:start_date]
      end_date = phase_details[:end_date]

      if (start_date == nil || start_date <= Time.current) and (end_date == nil || end_date > Time.current)
        return phase[1]
      end
    end

    nil
  end

  def self.allowed_graduation_years
    if not current
      return []
    end

    current[:graduation_years] || []
  end

  def self.additional_allowed_emails
    if not current
      return []
    end

    current[:additional_allowed_emails] || []
  end

  def self.allow_signup?(user)
    allowed_graduation_years.include?(user.graduation_year) || additional_allowed_emails.include?(user.email)
  end

end
