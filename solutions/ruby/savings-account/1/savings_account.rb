module SavingsAccount
  def self.interest_rate(balance)
    if balance < 0
      3.213
    elsif balance >= 0 && balance < 1000
      0.5
    elsif balance >= 1000 && balance < 5000
      1.621
    elsif balance >= 5000
      2.475
    end
  end

  def self.annual_balance_update(balance)
    balance + balance * interest_rate(balance) / 100
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    count = 0
    while current_balance < desired_balance
      count += 1
      current_balance = annual_balance_update(current_balance)
    end
    count
  end
end
