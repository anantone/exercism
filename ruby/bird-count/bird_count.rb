class BirdCount

  private
  
  def self.last_week
    [0, 2, 5, 3, 7, 8, 4]
  end

  attr_writer :birds_per_day

  def initialize(birds_per_day)
    self.birds_per_day = birds_per_day
  end

  public

  attr_reader :birds_per_day

  def yesterday
    birds_per_day[-2]
  end

  def total
    birds_per_day.sum
  end

  def busy_days
    birds_per_day.select { |n| n >= 5 }.length
  end

  def day_without_birds?
    birds_per_day.include?(0)
  end
  
end
