# Given an age in (Earth) seconds, returns its equivalent in local orbital years for each solar system planet, when called with `on_planet_name` (`on_mercury`, `on_earth`)..
class SpaceAge

  PYES = PLANET_YEAR_IN_EARTH_SECONDS = {
                 mercury:  7600543r,
                 earth:    31557600r,
                 venus:    19414149r,
                 mars:     59354032r,
                 jupiter:  374355659r,
                 saturn:   929292362r,
                 uranus:   2651370019r,
                 neptune:  5200418560r
}

  private_constant :PYES

  private

  attr_accessor :age_in_seconds

  def method_missing(methId)
    planet = methId.to_s.match(/on_(.+)/)[1].to_sym
    planet_years(planet)
  end

  def planet_years(planet)
    self.age_in_seconds / PYES[planet]
  end

  def initialize(age_in_seconds)
    self.age_in_seconds = age_in_seconds
  end

end
