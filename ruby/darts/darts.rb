class Darts

  private
  attr_writer :distance_to_center

  def initialize(x, y)
    self.distance_to_center = Math.sqrt(x.abs**2 + y.abs**2)
  end

  public
  attr_reader :distance_to_center
  
  def score
    case distance_to_center
    when (0..1)
      10
    when (1..5)
      5
    when (5..10)
      1
    else
      0
    end
  end
end