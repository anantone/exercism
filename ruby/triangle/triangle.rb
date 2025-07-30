class Triangle

  attr_accessor :side1, :side2, :side3

  def initialize(sides)
    self.side1,
    self.side2,
    self.side3 = [sides[0], sides[1], sides[2]]
  end

  def triangle?
    side1 > 0 && side2 > 0 && side3 > 0 && side1 + side2 >= side3 && side2 + side3 >= side1 && side1 + side3 >= side2
  end

  def equilateral?
    triangle? && side1 == side2 && side2 == side3
  end

  def isosceles?
    triangle? && (side1 == side2 || side2 == side3 || side3 == side1)
  end

  def scalene?
    triangle? && (side1 != side2 && side2 != side3 && side3 != side1)
  end

end