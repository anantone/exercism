module Grains

  def self.square(number)
    # Validate number input
    unless (1..64).include?(number)
      raise ArgumentError.new
    end
    # Calculate 1 doubles number times
    doubles = [1]
    (number-1).times { doubles.push(doubles[-1]*2) }
    return doubles[-1]
  end

  # This is what is tested, but it should take same number argument and return the total at that step (and not do the calculation again from square method)
  def self.total
    doubles = [1]
    (63).times { doubles.push(doubles[-1]*2) }
    doubles.sum
  end
  
end
