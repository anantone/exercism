class SimpleCalculator

  class UnsupportedOperation < StandardError
    def initialize(msg = "This operation is not supported.")
      super(msg)
    end
  end

  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)

    unless first_operand.is_a?(Integer) && second_operand.is_a?(Integer)
      raise ArgumentError.new("Invalid argument: operands must be integers.")
    end

    unless ALLOWED_OPERATIONS.include?(operation)
      raise UnsupportedOperation.new("Operation '#{operation}' is not supported.")
    
    end

    if operation == '+'
      "#{first_operand} #{operation} #{second_operand} = #{first_operand + second_operand}"
    elsif operation == '*'
      "#{first_operand} #{operation} #{second_operand} = #{first_operand * second_operand}"
    elsif operation == '/'
      if second_operand == 0
        return "Division by zero is not allowed."
      else
        "#{first_operand} #{operation} #{second_operand} = #{first_operand / second_operand}"
      end
    end

  end
end
