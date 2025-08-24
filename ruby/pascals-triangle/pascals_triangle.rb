class Triangle

  def initialize(number)
    unless number <= 0
      @number = number
    else
      raise ArgumentError
    end
  end

  attr_reader :number

  def rows
    triangle = [[1]]
    (0...number-1).each do |previous_row|
      triangle = build_new_row(triangle, previous_row)
    end
    triangle
  end

  def build_new_row(triangle, previous_row)
    new_row = [1]
    (0...triangle[previous_row].length-1).each do |i|
      new_row.push(triangle[previous_row][i] + triangle[previous_row][i+1])
    end
    new_row.push(1)
    triangle.push(new_row)
    triangle
  end
  
end
