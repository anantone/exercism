class Yacht

  private

  attr_writer :score

  def initialize(roll, category)
    self.score = send(category.tr(' ', '_'), roll.tally)
  end

  def yacht(tally)
    tally.any? { |side, times_rolled| times_rolled == 5 } ? 50 : 0
  end

  def choice(tally)
    tally.keys.sum do |key|
      key * tally[key]
    end
  end

  def big_straight(tally)
    tally.values_at(2, 3, 4, 5, 6).uniq == [1] ? 30 : 0
  end

  def little_straight(tally)
    tally.values_at(1, 2, 3, 4, 5).uniq == [1] ? 30 : 0
  end

  def four_of_a_kind(tally)
    tally.keys.each do |key|
      return key * 4 if tally[key] >= 4
    end
    0
  end

  def full_house(tally)
    if tally.value?(3) && tally.value?(2)
      3 * tally.key(3) + 2 * tally.key(2)
    else
      0
    end
  end

  def sixes(tally)
    tally[6] * 6 || 0
  end

  def fives(tally)
    begin
      tally[5] * 5
    rescue
      0
    end
  end

  def fours(tally)
    tally[4] * 4 || 0
  end

  def threes(tally)
    tally[3] * 3 || 0
  end

  def twos(tally)
    tally[2] * 2 || 0
  end

  def ones(tally)
    begin
      tally[1] * 1
    rescue
      0
    end
  end

  public attr_reader :score

end
