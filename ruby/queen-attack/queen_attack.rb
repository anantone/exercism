class Queens

  private
  
  attr_accessor :positions
  
  def initialize(positions)
    self.positions = positions
    raise ArgumentError unless positions.values.flatten.all? { |value| (0..7).include?(value) }
  end

  def same_row?
    positions.values[0][0] == positions.values[1][0]
  end

  def same_column?
    positions.values[0][1] == positions.values[1][1]
  end

  def same_diagonal?
    (positions.values[0][0] - positions.values[1][0]).abs == (positions.values[0][1] - positions.values[1][1]).abs
  end

  public
  
  def attack?
    same_row? || same_column? || same_diagonal?
  end
  
end
