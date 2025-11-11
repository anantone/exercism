module BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError if input_base <= 1 || output_base <= 1
    digits.each do |digit|
      raise ArgumentError if digit < 0 || digit > input_base - 1
    end
    if input_base == 10
      return decimal_to_base(digits, output_base)
    elsif output_base == 10
      return base_to_decimal(input_base, digits)
    else
      decimal = base_to_decimal(input_base, digits)
      base = decimal_to_base(decimal, output_base)
      return base
    end
    
  end

  def self.base_to_decimal(input_base, digits)
    Array(
      digits
        .reverse
        .each_with_index
        .sum do |digit, index|
          digit * input_base**index
        end
        .digits
        .reverse
      )
  end

  def self.decimal_to_base(digits, output_base)
    number = digits.join.to_i
    return [0] if number == 0
    result = []
    while number > 0
      if (number % output_base).zero?
        result.push(0)
      else
        result.push(number % output_base)
      end
      number /= output_base
    end
    result.reverse
  end
end