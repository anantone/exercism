class Squares
  
  def initialize(n)
    @n = n
  end

  def square_of_sum
    (@n * (@n + 1) / 2) ** 2
  end

  def sum_of_squares
    (1..@n).sum(0){|x| x*x}
  end

  def difference
    (square_of_sum - sum_of_squares).abs
  end

end
