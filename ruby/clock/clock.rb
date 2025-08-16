class Clock

  HOURS_PER_DAY = 24
  MINUTES_PER_HOUR = 60

  attr_accessor :hour, :minute

  def initialize(hour: 0, minute: 0)

    self.hour = hour.modulo(HOURS_PER_DAY)
    self.minute = minute
    unless self.hour
      self.hour = 00
    end
    unless self.minute
      self.minute = 00
    end
    # Convert minutes into hours and process
    if self.minute >= MINUTES_PER_HOUR || self.minute < 0
      self.hour += self.minute / MINUTES_PER_HOUR
      self.minute = self.minute % MINUTES_PER_HOUR
    end
    # Convert hours into days
    if self.hour >= HOURS_PER_DAY || self.hour <= -HOURS_PER_DAY
      self.hour = self.hour % HOURS_PER_DAY
    end
    # Process negative hours
    if self.hour < 0
      self.hour += HOURS_PER_DAY
    end
  end

  def to_s
    "%02d:%02d" % [self.hour, self.minute]
  end

  def +(new_clock)
    Clock.new(hour: self.hour + new_clock.hour, minute: self.minute + new_clock.minute)
  end

  def -(new_clock)
    Clock.new(hour: self.hour - new_clock.hour, minute: self.minute - new_clock.minute)
  end

  def ==(new_clock)
    self.hour == new_clock.hour && self.minute == new_clock.minute
  end

end
