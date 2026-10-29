class Palindromes
  class Result
    attr_reader :value, :factors
    def initialize(entries)
      @value   = entries.dig(0, 0)
      @factors = entries.map { |_, pair| pair }
    end
  end

  def initialize(min_factor: 1, max_factor: 9)
    raise ArgumentError, "min must be <= max" if min_factor > max_factor
    @min = min_factor
    @max = max_factor
  end

  def generate
    @smallest_entries = find_extreme(ascending: true)
    @largest_entries  = find_extreme(ascending: false)
  end

  def smallest
    generate unless defined?(@smallest_entries)
    Result.new(@smallest_entries)
  end

  def largest
    generate unless defined?(@largest_entries)
    Result.new(@largest_entries)
  end

  private

  def find_extreme(ascending:)
    best = nil
    entries = []
    outer = ascending ? (@min..@max).to_a : (@min..@max).to_a.reverse

    outer.each do |a|
      row_limit = a * a
      break if best && (ascending ? row_limit > best : row_limit < best)

      inner = ascending ? (a..@max) : (a.downto(@min))
      inner.each do |b|
        product = a * b
        break if best && (ascending ? product > best : product < best)

        next unless palindrome?(product)

        if best.nil? || (ascending ? product < best : product > best)
          best = product
          entries = [[product, [a, b].sort]]
        elsif product == best
          entries << [product, [a, b].sort]
        end
      end
    end

    entries.sort_by! { |_, (x, y)| [x, y] }
  end

  def palindrome?(x)
    x.to_s == x.to_s.reverse
  end
end