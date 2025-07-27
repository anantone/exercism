module RecordKeeping
  @@used_names = []

  def used_names
    @@used_names
  end
end

class Robot
  extend RecordKeeping

  attr_accessor :name, :name_set, :used_names

  def initialize
    @name_set = false
    self.name = self.name
  end

  def name
    if @name_set == false
      candidate_name = self.name_generation
      while @@used_names.include?(candidate_name)
        candidate_name = self.name_generation
      end
      new_name = candidate_name
      @@used_names.push(new_name)
      @name_set = true
      new_name
    end
  end

  def name_generation
    "%s%3d" % [('AA'..'ZZ').to_a.sample, rand(1..999)]
  end

  def reset
    @name_set = false
  end

  # Clear any shared state used to track robot names. Best if not used by solution
  def self.forget
    @@used_names = []
  end

end

