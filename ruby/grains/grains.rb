module Grains

  NUMBER_OF_SQUARES = 64

  def self.square(number)
    # Validate number input
    unless (1..64).include?(number)
      raise ArgumentError.new
    end
    # Apply geometric series formula
    # as a bitwise operation
    1 << (number-1)
  end

  def self.total
  # The constant could easily be a variable,
  # if we wanted the total at any given point
    (1 << NUMBER_OF_SQUARES) - 1
  end
  
end
