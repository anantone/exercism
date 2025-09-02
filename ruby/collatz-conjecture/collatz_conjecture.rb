module CollatzConjecture

  def self.steps(number, count = 0)
    raise ArgumentError if number <= 0
    if number == 1
      count
    else
      count += 1
      if number % 2 == 0 
        number /= 2
      else
        number = number * 3 + 1
      end
      steps(number, count)
    end
  end

end
