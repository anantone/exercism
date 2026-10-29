class Knapsack
  attr_accessor :max_weight

  def initialize(max_weight)
    self.max_weight = max_weight
  end

  def max_value(items)
    return 0 if items.empty? || max_weight <= 0

    n = items.length
    # Create a DP table: dp[i][w] = max value using first i items with capacity w
    # We use (n + 1) rows and (max_weight + 1) columns
    dp = Array.new(n + 1) { Array.new(max_weight + 1, 0) }

    (1..n).each do |i|
      item = items[i - 1]
      weight = item.weight
      value = item.value

      (0..max_weight).each do |w|
        # Option 1: Don't include the current item
        without_item = dp[i - 1][w]

        # Option 2: Include the current item (only if it fits)
        with_item = 0
        if weight <= w
          with_item = value + dp[i - 1][w - weight]
        end

        # Take the maximum of the two options
        dp[i][w] = [without_item, with_item].max
      end
    end

    dp[n][max_weight]
  end
end