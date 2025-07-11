=begin
Write your code for the 'Darts' exercise in this file. Make the tests in
`darts_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/darts` directory.
=end

class Darts
  def initialize(x, y)
    @x = x
    @y = y
    @dist = Math.sqrt(x.abs**2 + y.abs**2)
  end
  
  def score
    if @dist <= 1
      10
    elsif @dist <= 5
      5
    elsif @dist <= 10
      1
    else
      0
    end
  end
end