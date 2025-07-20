=begin
# Notes regarding time measurement
* On Earth, a second is a 60th of a 60th of a 24th of the planet's rotation on its own axis. The divisions by 60 and 24 come from base twelve counting, which itself is predicated on the shape of human hands (12 joints, 3 for each of the 4 long fingers, counted with the opposite thumb; as in ancient Babylon or contemporary India). Even though humans later laboriously defined seconds as "9 192 631 770 periods of the ground-state hyperfine transitions of caesium-133" (thus requiring the invention of "leap seconds", which we won't get into!), seconds are still extremely geocentric. This being said, we are assuming a human traveling to other planets, so the customs officer would probably understand "where they're coming from".
* For convenience, an Earth year (or orbital period) adds up to 31 557 600 Earth seconds. We are also provided a chart of the other planets' orbital periods in Earth years. Multiplying this value by 31 557 600, we get the number of Earth seconds per planet year. Its inverse is the number of planet years per Earth second, which for these slow planets is rather a fraction of planet year per Earth second. FOPYPES is just a convenient abbreviation. 
=end

class SpaceAge

  FOPYPES = FRACTION_OF_PLANET_YEAR_PER_EARTH_SECOND = {  mercury: 1/7600543r,
                  earth: 1/31557600r,
                  venus: 1/19414149r,
                  mars: 1/59354032r,
                  jupiter: 1/374355659r,
                  saturn: 1/929292362r,
                  uranus: 1/2651370019r,
                  neptune: 1/5200418560r}

  private_constant :FOPYPES
 
  def initialize(age_in_seconds)
    @age_in_seconds = age_in_seconds
  end

  def on_mercury
    @age_in_seconds * FOPYPES[:mercury]
  end

  def on_venus
    @age_in_seconds * FOPYPES[:venus]
  end

  def on_earth
    @age_in_seconds * FOPYPES[:earth]
  end

  def on_mars
    @age_in_seconds * FOPYPES[:mars]
  end

  def on_jupiter
    @age_in_seconds * FOPYPES[:jupiter]
  end

  def on_saturn
    @age_in_seconds * FOPYPES[:saturn]
  end

  def on_uranus
    @age_in_seconds * FOPYPES[:uranus]
  end

  def on_neptune
    @age_in_seconds * FOPYPES[:neptune]
  end

end
