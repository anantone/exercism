class Triangle

  def initialize(number)
    self.number = number
  end

  attr_accessor :number

  def rows

    if number == 1
      return [[1]]
    end

    count = 2
    triangle = [[1], [1, 1]]

    while count < number
      b = [1]
      (0...(triangle[count-1].length)-1).each do |i|
        b.push(triangle[count-1][i] + triangle[count-1][i+1])
      end
      b.push(1)
      triangle.push(b)
      count += 1
    end
    triangle
  end
  
end
