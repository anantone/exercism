class Squares

  private

  attr_writer :square_of_sum, :sum_of_squares, :difference

  def initialize(n)
    self.square_of_sum = (n * n.next/2)**2
    self.sum_of_squares = n * n.next * (2 * n + 1)/6
    self.difference = square_of_sum - sum_of_squares
  end

  public

  attr_reader :square_of_sum, :sum_of_squares, :difference

end

