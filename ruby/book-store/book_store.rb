module BookStore
  GROUP_PRICES = { 1 => 8.0, 2 => 15.2, 3 => 21.6, 4 => 25.6, 5 => 30.0 }.freeze

  def self.calculate_price(basket)
    @memo = {}
    best(basket.tally.values.sort.reverse)
  end

  private_class_method

  def self.best(counts)
    return 0.0 if counts.empty?

    @memo[counts] ||= (1..counts.length).map do |size|
      # take one copy from the `size` titles with the largest remaining counts
      remaining = counts.each_index
                        .sort_by { |i| -counts[i] }
                        .flat_map { |i| i < size ? [counts[i] - 1] : [counts[i]] }
                        .reject(&:zero?)
                      .sort.reverse
      GROUP_PRICES[size] + best(remaining)
    end.min
  end
end