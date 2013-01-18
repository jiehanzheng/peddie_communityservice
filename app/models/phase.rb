class Phase
  def self.current
    phases = Hash.try_convert(Settings.phases).with_indifferent_access

    phases.each do |p|
      phase_name = p[0].to_s
      phase_details = p[1]

      if phase_details[:start_date] <= Time.current and Time.current <= phase_details[:end_date]
        return p
      end
    end

    []
  end

  def self.details
    if not current
      return false
    end

    current[1]
  end

  def self.name
    if not current
      return false
    end

    current[0].to_s
  end
end