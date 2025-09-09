module PerfectNumber
  extend self

  def classify(number)
    raise RuntimeError.new if number <= 0
    case 
    when aliquot(number) == number then 'perfect'
    when aliquot(number) < number then 'deficient'
    else
      'abundant'
    end
  end

  def aliquot(number)
    factors = (2...number).each.with_object([1]) do |divisor, factors|
      factors.push(divisor) if number % divisor == 0
    end.sum
  end

end
