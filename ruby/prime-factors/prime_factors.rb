class PrimeFactors

  def self.of(number)
    factors = []
    i = 2
    while number > 1
      while number % i == 0
          number = number / i
          factors.push(i)
      end
          i += 1
    end
    factors
  end

end

