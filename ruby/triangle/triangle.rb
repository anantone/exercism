class Triangle

  def initialize(sides)
    @side1 = sides[0]
    @side2 = sides[1]
    @side3 = sides[2]
  end

  def triangle?
    @side1 > 0 && @side2 > 0 && @side3 > 0 && @side1 + @side2 >= @side3 && @side2 + @side3 >= @side1 && @side1 + @side3 >= @side2
  end

  def equilateral?
    triangle? && @side1 == @side2 && @side2 == @side3
  end

  def isosceles?
    triangle? && (@side1 == @side2 || @side2 == @side3 || @side3 == @side1)
  end

  def scalene?
    triangle? && (@side1 != @side2 && @side2 != @side3 && @side3 != @side1)
  end

end