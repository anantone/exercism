class Robot

  @@used_monikers = []
  attr_accessor :moniker, :moniker_set

  def initialize
    @moniker_set = false
    self.moniker = nil
  end

  def self.register
    @@used_monikers
  end

  def name
    if @moniker_set == false
      candidate = moniker_generation
      while @@used_monikers.include?(candidate)
        candidate = moniker_generation
      end
      new_moniker = candidate
      @@used_monikers.push(new_moniker)
      @moniker_set = true
      self.moniker = new_moniker
    end
    moniker
  end

  def moniker_generation
    "%s%03d" % [('AA'..'ZZ').to_a.sample, rand(0..999)]
  end

  def reset
    @moniker_set = false
    self.moniker = nil
  end

  def self.forget
    @@used_monikers = []
  end

end

