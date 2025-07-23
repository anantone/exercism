class SpaceAge

  PYES = PLANET_YEAR_PER_EARTH_SECOND = {
                  mercury: 1/7600543r,
                  earth: 1/31557600r,
                  venus: 1/19414149r,
                  mars: 1/59354032r,
                  jupiter: 1/374355659r,
                  saturn: 1/929292362r,
                  uranus: 1/2651370019r,
                  neptune: 1/5200418560r
}

  private_constant :PYES

  def initialize(age_in_seconds)
    @age_in_seconds = age_in_seconds
  end

  def on_mercury
    @age_in_seconds * PYES[:mercury]
  end

  def on_venus
    @age_in_seconds * PYES[:venus]
  end

  def on_earth
    @age_in_seconds * PYES[:earth]
  end

  def on_mars
    @age_in_seconds * PYES[:mars]
  end

  def on_jupiter
    @age_in_seconds * PYES[:jupiter]
  end

  def on_saturn
    @age_in_seconds * PYES[:saturn]
  end

  def on_uranus
    @age_in_seconds * PYES[:uranus]
  end

  def on_neptune
    @age_in_seconds * PYES[:neptune]
  end

end