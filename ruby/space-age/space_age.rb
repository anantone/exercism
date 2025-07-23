class SpaceAge

  PYES = PLANET_YEAR_IN_EARTH_SECONDS = {
                 on_mercury:	 7600543r,
                 on_earth:		 31557600r,
                 on_venus:		 19414149r,
                 on_mars:		  59354032r,
                 on_jupiter:	 374355659r,
                 on_saturn: 	 929292362r,
                 on_uranus:  	2651370019r,
                 on_neptune:	 5200418560r
}

  private_constant :PYES

  def initialize(age_in_seconds)
    @age_in_seconds = age_in_seconds
  end

  def method_missing(methId)
    planet_years(methId)
  end

  def planet_years(planet)
    @age_in_seconds / PYES[planet]
  end

end
