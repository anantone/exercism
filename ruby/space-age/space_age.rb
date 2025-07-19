class SpaceAge

  ORB = ORBITAL_PERIODS_IN_EARTH_YEARS = {  mercury: 0.2408467, 
                                            venus: 0.61519726, 
                                            mars: 1.8808158, 
                                            jupiter: 11.862615, 
                                            saturn: 29.447498, 
                                            uranus: 84.016846, 
                                            neptune: 164.79132}
 
  def initialize(age_in_seconds)
    @age_in_seconds = age_in_seconds
  end

  def on_earth
    @age_in_seconds / 31557600.0
  end

  def on_mercury
    on_earth / ORB[:mercury]
  end

  def on_venus
    on_earth / ORB[:venus]
  end

  def on_mars
    on_earth / ORB[:mars]
  end

  def on_jupiter
    on_earth / ORB[:jupiter]
  end

  def on_saturn
    on_earth / ORB[:saturn]
  end

  def on_uranus
    on_earth / ORB[:uranus]
  end

  def on_neptune
    on_earth / ORB[:neptune]
  end

end
