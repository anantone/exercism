class SpiralMatrix
  
  private

  attr_writer :size
  
  def initialize(size)
    @size = size
  end

  public
  
  attr_reader :size

  def matrix  
    matrix = Array.new(size) { Array.new(size) }
    x, y = 0, 0
    dx, dy = 1, 0
    (1..size**2).each do |num|
      matrix[y][x] = num
      if !(0...size).include?(x + dx) || 
          !(0...size).include?(y + dy) ||
          matrix[y + dy][x + dx]
        dx, dy = -dy, dx
      end
      x += dx
      y += dy
    end
    matrix
  end
  
end
