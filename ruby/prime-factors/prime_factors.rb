class PrimeFactors

  def self.of(number)
    primes = []
    i = 2
    while i <= number
      if is_prime?(i)
        if number % i == 0
          number = number / i
          primes.push(i)
        else
          i += 1
        end
      else
        i += 1
      end
    end
    primes
  end

  def self.is_prime?(number)
    (2...number).each do |num|
      if number % num == 0
        return false
      end
    end
    true
  end
  
end
