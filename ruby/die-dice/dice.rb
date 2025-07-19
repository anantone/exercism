class Die

  def initialize(sides = 6)
    self.sides = sides
  end

  def roll
    rand(1.. self.sides)
  end

end

=begin
class Dice
  include Die

  def dice_throw(dice, sides, top = nil, bottom = nil, middle = nil)
    value = []
    (1..dice).each do
      value.push(Die.roll)
    end
  end

end
=end
