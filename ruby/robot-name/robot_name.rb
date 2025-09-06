class Robot

  @@used_monikers = []
  attr_accessor :moniker, :name_set

  def initialize
    @name_set = false
    self.moniker = nil
  end

  def self.register
    puts @@used_monikers
  end

  def name
    if @name_set == false
      candidate = moniker_generation
      while @@used_monikers.include?(candidate)
        candidate = moniker_generation
      end
      new_moniker = candidate
      @@used_monikers.push(new_moniker)
      @name_set = true
      self.moniker = new_moniker
    end
    moniker
  end

  def moniker_generation
    "%s%3d" % [('AA'..'ZZ').to_a.sample, rand(100..999)]
  end

  def reset
    @name_set = false
    self.moniker = nil
  end

  # Clear any shared state used to track robot names. Best if not used by solution
  def self.forget
    @@used_monikers = []
  end

end

