class AssemblyLine
  
  CARS_PER_HOUR_PER_SPEED = 221

  private

  attr_writer :speed
  
  def initialize(speed)
    self.speed = speed
  end

  public

  attr_reader :speed

  def production_rate_per_hour
    if speed == 10
      modifier = 0.77
    elsif speed == 9
      modifier = 0.8
    elsif 5 <= speed and speed <= 8
      modifier = 0.9
    else
      modifier = 1
    end
    speed * CARS_PER_HOUR_PER_SPEED * modifier
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
  
end
