class Darts

  private
  attr_writer :distance_to_center

  def initialize(x, y)
    self.distance_to_center = Math.sqrt(x.abs**2 + y.abs**2)
  end

  public
  attr_reader :distance_to_center
  
  def score
    if distance_to_center <= 1
      10
    elsif distance_to_center <= 5
      5
    elsif distance_to_center <= 10
      1
    else
      0
    end
  end
end