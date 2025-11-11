module BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError if input_base <= 1 || output_base <= 1
    
    digits.each do |digit|
      raise ArgumentError if digit.negative? || digit > input_base - 1
    end
    
    decimal = base_to_decimal(input_base, digits)
    decimal_to_base(decimal, output_base)
  end

  def self.base_to_decimal(input_base, digits)
    Array(
      digits
        .reverse
        .each_with_index
        .sum { |digit, index| digit * input_base**index }
        .digits
        .reverse
    )
  end

  def self.decimal_to_base(digits, output_base)
    number = digits.join.to_i
    return [0] if number.zero?
    result = []
    while number.positive?
      result.push((number % output_base).zero? ? 0 : number % output_base)
      number /= output_base
    end
    result.reverse
  end
end