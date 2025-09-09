module PerfectNumber
  extend self

  def classify(number)
    raise RuntimeError.new if number <= 0
    case aliquot(number)
    when number then 'perfect'
    when ->(x) { x < number } then 'deficient'
    else 'abundant' 
    end
  end

  def aliquot(number)
    factors = (2...number).each.with_object([1]) do |divisor, factors|
      factors.push(divisor) if number % divisor == 0
    end.sum
  end

end
