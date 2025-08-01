# Given an age in (Earth) seconds, returns its equivalent in local orbital years for each solar system planet, when called with `on_planet_name` (`on_mercury`, `on_earth`)
class SpaceAge

  PYES = PLANET_YEAR_IN_EARTH_SECONDS = {
                 on_mercury:  7600543r,
                 on_venus:    19414149r,
                 on_earth:    31557600r,
                 on_mars:     59354032r,
                 on_jupiter:  374355659r,
                 on_saturn:   929292362r,
                 on_uranus:   2651370019r,
                 on_neptune:  5200418560r
}

  private_constant :PYES

  private

  attr_accessor :age_in_seconds

  def method_missing(method_name, *args)
    if respond_to_missing?(method_name)
      self.class.define_method(method_name) do |method_name|
        self._age_in_seconds / PYES[method_name]
      end
    else
      super
    end
  end

  def respond_to_missing?(method_name)
    PYES.keys.include?(method_name)
  end

  def initialize(age_in_seconds)
    self.age_in_seconds = age_in_seconds
  end

end

