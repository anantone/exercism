class AssemblyLine
  CARS_PER_HOUR_PER_SPEED = 221
  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    if @speed == 10
      modifier = 0.77
    elsif @speed == 9
      modifier = 0.8
    elsif 5 <= @speed and @speed <= 8
      modifier = 0.9
    else
      modifier = 1
    end
    @speed * CARS_PER_HOUR_PER_SPEED * modifier
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end
end
