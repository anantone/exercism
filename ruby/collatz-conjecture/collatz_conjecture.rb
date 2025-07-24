module CollatzConjecture

  def self.steps(number, count = [])
    if number <= 0
      raise ArgumentError.new
    end
    if number == 1
      count.length
    else
      if number % 2 == 0
        count.push(number)
        steps(number / 2, count)
      else
        count.push(number)
        steps(number * 3 + 1, count)
      end
    end
  end

end
