class Microwave

  private

  attr_writer :input, :minute, :second
  
  def initialize(input)
    self.input = input
    self.minute = input / 100
    self.second = input % 100
    if self.second >= 60
      self.minute += 1
      self.second -= 60
    end
  end

  public
  
  attr_reader :input, :minute, :second
  
  def timer
    "%02d:%02d" % [minute, second]
  end
  
end
