class SpaceAge
  def initialize(age_in_seconds)
    @age_in_seconds = age_in_seconds
  end

  def on_earth
    @age_in_seconds / 31557600.0
  end

  def on_mercury
    on_earth * (1 / 0.2408467)
  end

  def on_venus
    on_earth * (1 / 0.61519726)
  end

  def on_mars
    on_earth * (1 / 1.8808158)
  end

  def on_jupiter
    on_earth * (1 / 11.862615)
  end

  def on_saturn
    on_earth * (1 / 29.447498)
  end

  def on_uranus
    on_earth * (1 / 84.016846)
  end

  def on_neptune
    on_earth * (1 / 164.79132)
  end

end
