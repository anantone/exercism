class Yacht

  private

  attr_writer :score
  attr_accessor :tally

  def initialize(roll, category)
    self.tally = roll.tally(Hash.new(0))
    self.score = send(category.tr(' ', '_'))
  end

  def yacht
    tally.any? { |side, times_rolled| times_rolled == 5 } ? 50 : 0
  end

  def choice
    tally.keys.sum { |key| key * tally[key] }
  end

  def big_straight
    tally.values_at(2, 3, 4, 5, 6).uniq == [1] ? 30 : 0
  end

  def little_straight
    tally.values_at(1, 2, 3, 4, 5).uniq == [1] ? 30 : 0
  end

  def four_of_a_kind
    tally.keys.find(proc {0}) { |key| tally[key] >= 4 } * 4
  end

  def full_house
    tally.value?(3) && tally.value?(2) ?  3 * tally.key(3) + 2 * tally.key(2) : 0
  end

  def sixes
    tally[6] * 6
  end

  def fives
    tally[5] * 5
  end

  def fours
    tally[4] * 4
  end

  def threes
    tally[3] * 3
  end

  def twos
    tally[2] * 2
  end

  def ones
    tally[1] * 1
  end

  public attr_reader :score

end
