class SpaceAge
  def initialize(age_in_seconds)
    @age_in_seconds = age_in_seconds
  end

  def on_earth
    @age_in_seconds / 31557600.0
  end

  def on_mercury
    @age_in_seconds / 31557600.0 * (1 / 0.2408467)
  end

  def on_venus
    @age_in_seconds / 31557600.0 * (1 / 0.61519726)
  end

  def on_mars
    @age_in_seconds / 31557600.0 * (1 / 1.8808158)
  end

  def on_jupiter
    @age_in_seconds / 31557600.0 * (1 / 11.862615)
  end

  def on_saturn
    @age_in_seconds / 31557600.0 * (1 / 29.447498)
  end

  def on_uranus
    @age_in_seconds / 31557600.0 * (1 / 84.016846)
  end

  def on_neptune
    @age_in_seconds / 31557600.0 * (1 / 164.79132)
  end

end
