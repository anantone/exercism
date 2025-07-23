# Calculates the difference between the square of the sum and the sum of the squares of the first N natural numbers.
class Squares

  private

  attr_writer :square_of_sum, :sum_of_squares, :difference

  def initialize(number)
    self.square_of_sum = (number * number.next/2)**2
    self.sum_of_squares = number * number.next * (2 * number + 1)/6
    self.difference = square_of_sum - sum_of_squares
  end

  public

  attr_reader :square_of_sum, :sum_of_squares, :difference

end
