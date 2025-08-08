module PerfectNumber

  def self.classify(number)
    # Assert number positive
    if number <= 0
      raise RuntimeError.new
    end
    # Classify based on equality with aliquot
    if aliquot(number) == number
      'perfect'
    elsif aliquot(number) < number
      'deficient'
    else
      'abundant'
    end
  end

  def self.aliquot(number)
    # Create array with factors of number
    factors = [1]
    (2...number).each do |divisor|
      if number % divisor == 0
        factors.push(divisor)
      end
    end
    # Return array sum
    factors.sum
  end

end
