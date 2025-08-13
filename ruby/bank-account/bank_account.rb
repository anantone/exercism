class BankAccount

  def initialize
    self.status = 'closed'
  end

  attr_accessor :status, :value

  def open
    if status == 'closed'
      self.status = 'open'
      self.value = 0
    else
      raise ArgumentError.new("You can't open an already open account")
    end
  end

  def close
    if status == 'open'
      self.status = 'closed'
    else
      raise ArgumentError.new("You can't close an already closed account")
    end
  end

  def deposit(amount)
    if status == 'open'
      if amount < 0
        raise ArgumentError.new("You can't deposit a negative amount")
      else
        self.value += amount
      end
    else
      raise ArgumentError.new("You can't deposit into a closed account.")
    end
  end

  def withdraw(amount)
    if status == 'open'
      if amount < 0
        raise ArgumentError.new("You can't withdraw a negative amount")
      elsif amount > value
        raise ArgumentError.new("You can't withdraw more than you have")
      else
        self.value -= amount
      end
    else
      raise ArgumentError.new("You can't withdraw from a closed account.")
    end
  end

  def balance
    if status == 'open'
      return self.value
    else
      raise ArgumentError.new("You can't check the balance of a closed account.")
    end
  end

end
