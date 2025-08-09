module CollatzConjecture

  def self.steps(number, count = 0)
    if number <= 0
      raise ArgumentError.new
    end
    if number == 1
      count
    else
      if number % 2 == 0
        count += 1
        steps(number / 2, count)
      else
        count += 1
        steps(number * 3 + 1, count)
      end
    end
  end

end
