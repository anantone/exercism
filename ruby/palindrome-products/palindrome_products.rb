class Palindromes

  private

  attr_writer :range

  def initialize(min_factor: 1, max_factor: 9)
    raise ArgumentError.new("min must be <= max") if min_factor > max_factor
    self.range = (min_factor..max_factor).to_a
  end

  public

  attr_reader :range
  attr_accessor :palindromes

  def generate
    self.palindromes = range.repeated_combination(2).with_object([]) do |combi, products|
      if is_palindrome?((combi[0] * combi[1]))
        products.push([combi[0] * combi[1], [combi[0], combi[1]]])
      end
    end
  end

  def is_palindrome?(x)
    return false if x < 0 || (x % 10 == 0 && x != 0)

    reverted_number = 0
    while x > reverted_number
      reverted_number = reverted_number * 10 + x % 10
      x /= 10
    end

    x == reverted_number || x == reverted_number / 10
  end

  def smallest
    return [] if palindromes.empty?
    palindromes.group_by { |a| a[0] }[palindromes.min[0]]
  end

  def largest
    return [] if palindromes.empty?
    palindromes.group_by { |a| a[0] }[palindromes.max[0]]
  end

end

class Array

  def value
    return nil if self.empty?
    self[0][0]
  end

  def factors
    return [] if self.empty?
    if self.flatten.length == 3
      [self[0][1]]
    else
      factors = self.each_with_object([]) do |pair, list|
        list.push(pair[1])
      end
      factors.each { |pair| pair.sort! }.uniq
    end
  end

end

if __FILE__ == $PROGRAM_NAME

  a = Palindromes.new(max_factor: 12)
  a.generate
  puts a.largest.factors

end
