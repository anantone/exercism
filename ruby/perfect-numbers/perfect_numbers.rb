module PerfectNumber

  def self.classify(number)
    raise RuntimeError.new if number <= 0
    if aliquot(number) == number
      'perfect'
    elsif aliquot(number) < number
      'deficient'
    else
      'abundant'
    end
  end

  def self.aliquot(number)
    factors = [1]
    (2...number).each do |divisor|
      if number % divisor == 0
        factors.push(divisor)
      end
    end
    factors.sum
  end

end
