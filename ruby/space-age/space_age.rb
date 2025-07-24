# Given an age in (Earth) seconds, returns its equivalent in local orbital years for each solar system planet, when called with `on_planet_name` (`on_mercury`, `on_earth`)
class SpaceAge

  PYES = PLANET_YEAR_IN_EARTH_SECONDS = {
                 on_mercury:  7600543.8,
                 on_venus:    19414149.1,
                 on_earth:    31557600.0,
                 on_mars:     59354032.7,
                 on_jupiter:  374355659.1,
                 on_saturn:   929292362.9,
                 on_uranus:   2651370019.3,
                 on_neptune:  5200418560.0
}

  private_constant :PYES

  private

  attr_accessor :age_in_seconds

  def method_missing(method_name)
    if PYES.keys.include?(method_name) 
      planet_years(method_name)
    else
      super(method_name)
    end
  end

  def respond_to_missing?(method_name)
    PYES.keys.include?(method_name) || super
  end

  def planet_years(planet)
    self.age_in_seconds / PYES[planet]
  end

  def initialize(age_in_seconds)
    self.age_in_seconds = age_in_seconds
  end

end

nasa = SpaceAge.new(2112912000)
nasa.on_bananas
