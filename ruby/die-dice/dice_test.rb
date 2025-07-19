require 'minitest/autorun'
require_relative 'dice'

class DiceTest < Minitest::Test
  def roll_test
    die = Die.new
    allowed_range = (1..sides)
    informative_message = %q(One roll's result %s must be within %s)

    assert_includes allowed_range, die.roll,
        informative_message % [roll, allowed_range]
  end
end
