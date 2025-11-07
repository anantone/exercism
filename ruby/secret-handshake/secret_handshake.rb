class SecretHandshake
  private
  
  attr_writer :binary_number
  
  def initialize number
    self.binary_number = number.to_s(2)
  end

  public

  attr_reader :binary_number

  def commands
    commands = []
    commands << 'wink' if binary_number[-1] =='1'
    commands << 'double blink' if binary_number[-2] == '1'
    commands << 'close your eyes' if binary_number[-3] == '1'
    commands << 'jump' if binary_number[-4] == '1'
    commands.reverse! if binary_number[-5] == '1'
    commands
  end
end