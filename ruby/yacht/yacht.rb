class Yacht

  private

  attr_writer :score

  def initialize(roll, category)
    self.score = send(category.gsub(/ /, '_'), count(roll))
  end

  def count(roll)
    roll.tally({1 => 0, 2 => 0, 3=> 0 , 4 => 0, 5 => 0, 6 => 0})
  end

  def yacht(count)
    count.any? { |key, value| value == 5 } ? 50 : 0
  end

  def choice(count)
    (1..6).sum do |key|
      key * count[key]
    end
  end

  def big_straight(count)
    count.values_at(2, 3, 4, 5, 6).uniq == [1] ? 30 : 0
  end

  def little_straight(count)
    count.values_at(1, 2, 3, 4, 5).uniq == [1] ? 30 : 0
  end

  def four_of_a_kind(count)
    (1..6).each do |key|
      return key * 4 if count[key] >= 4
    end
    0
  end

  def full_house(count)
    if count.value?(3) && count.value?(2)
      3 * count.key(3) + 2 * count.key(2)
    else
      0
    end
  end

  def sixes(count)
    count[6] * 6
  end

  def fives(count)
    count[5] * 5
  end

  def fours(count)
    count[4] * 4
  end

  def threes(count)
    count[3] * 3
  end

  def twos(count)
    count[2] * 2
  end

  def ones(count)
    count[1] * 1
  end

  public attr_reader :score

end
