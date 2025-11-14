class SecretHandshake
  private
  
  attr_writer :number
  
  def initialize number
    self.number = number
  end

  public

  attr_reader :number

  def commands
    steps = []
    steps << 'wink' if number & 1 == 1
    steps << 'double blink' if number & 2 == 2
    steps << 'close your eyes' if number & 4 == 4
    steps << 'jump' if number & 8 == 8
    steps.reverse! if number & 16 == 16
    steps
  end
end