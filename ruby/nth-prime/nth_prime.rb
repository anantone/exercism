class Prime

  def self.nth(n, primes = [2])
    raise ArgumentError if n == 0
    i = 1 
    until primes.length == n
      if is_prime?(primes[-1] + i)
        primes.push(primes[-1] + i)
        i = 1
      else
        i += 1
      end
    end
    primes[-1]
  end

  def self.is_prime?(n)
    return false if n <= 1
    (2..Math.sqrt(n)).each do |i|
      return false if n % i == 0
    end
    return true
  end

end
