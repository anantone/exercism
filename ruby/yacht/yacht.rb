class Yacht

  private

  attr_writer :score
  attr_accessor :tally

  def initialize(roll, category)
    self.tally = roll.tally
    self.score = send(category.tr(' ', '_'))
  end

  def yacht
    tally.any? { |number, times_rolled| times_rolled == 5 } ? 50 : 0
  end

  def choice
    tally.keys.sum { |number| number * tally[number] }
  end

  def big_straight
    tally.values_at(2, 3, 4, 5, 6).uniq == [1] ? 30 : 0
  end

  def little_straight
    tally.values_at(1, 2, 3, 4, 5).uniq == [1] ? 30 : 0
  end

  def four_of_a_kind
    tally.keys.find(proc {0}) { |number| tally[number] >= 4 } * 4
  end

  def full_house
    tally.value?(3) && tally.value?(2) ?  3 * tally.key(3) + 2 * tally.key(2) : 0
  end

  def sixes
    tally.fetch(6, 0) * 6
  end

  def fives
    tally.fetch(5, 0) * 5
  end

  def fours
    tally.fetch(4, 0) * 4
  end

  def threes
    tally.fetch(3, 0) * 3
  end

  def twos
    tally.fetch(2, 0) * 2
  end

  def ones
    tally.fetch(1, 0) * 1
  end

  public 
    
  attr_reader :score

end
