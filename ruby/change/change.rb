class Change
  def self.generate(denominations, amount)
    raise NegativeTargetError.new if amount.negative?
    return [] if amount.zero?

    valid_denoms = denominations.select { |d| d > 0 }.uniq.sort

    # No usable coins at all -> impossible
    raise ImpossibleCombinationError.new if valid_denoms.empty?

    dp     = Array.new(amount + 1, amount + 1)
    parent = Array.new(amount + 1, -1)
    dp[0]  = 0

    (1..amount).each do |i|
      valid_denoms.each do |coin|
        next if coin > i
        if dp[i - coin] + 1 < dp[i]
          dp[i]     = dp[i - coin] + 1
          parent[i] = coin
        end
      end
    end

    # Unreachable target (includes amount < smallest coin) -> impossible
    raise ImpossibleCombinationError.new if dp[amount] > amount

    result  = []
    current = amount
    while current > 0
      coin = parent[current]
      result << coin
      current -= coin
    end
    result.sort
  end

  class ImpossibleCombinationError < StandardError; end
  class NegativeTargetError < StandardError; end
end