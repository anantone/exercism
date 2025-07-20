class Squares

  def initialize(n)
    self.square_of_sum ||= (n * (n + 1) / 2) ** 2
    self.sum_of_squares ||= n * (n + 1) * (2 * n + 1) / 6
    self.difference ||= square_of_sum - sum_of_squares
  end

  attr_accessor :square_of_sum, :sum_of_squares, :difference

end
