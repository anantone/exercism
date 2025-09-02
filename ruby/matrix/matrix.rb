class Matrix

  private
  
  attr_writer :matrix

  def initialize(number_string)
    self.matrix = number_string.split("\n").map do |array|
      array.split(" ").map do |string|
        string.to_i
      end
    end
  end

  public

  attr_reader :matrix

  def row(number)
    matrix[number-1]
  end

  def column(number)
    matrix.map do |row|
      row[number-1]
    end
  end
  
end