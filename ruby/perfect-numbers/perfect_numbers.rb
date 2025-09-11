module PerfectNumber
  extend self

  def classify(number)
    raise RuntimeError if number <= 0
    case aliquot(number)
    when number then 'perfect'
    when ->(x) { x < number } then 'deficient'
    else 'abundant' 
    end
  end

  def aliquot(number)
    (1..number / 2).select { |divisor| (number % divisor).zero? }.sum
  end

end
