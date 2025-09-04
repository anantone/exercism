module CollatzConjecture

  def self.steps(number)
    raise ArgumentError if number <= 0
    count = 0
    until number == 1
      count += 1
      number = number.even? ? number / 2 : number * 3 + 1
    end
    count
  end

end
