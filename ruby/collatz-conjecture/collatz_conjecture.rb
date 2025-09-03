module CollatzConjecture

  def self.steps(number, count = 0)
    raise ArgumentError if number <= 0
    return count if number == 1
    count += 1
    number = number.even? ? number / 2 : number * 3 + 1
    steps(number, count)
  end

end
