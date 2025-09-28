class Robot

  LETTERS = ('AA'..'ZZ').to_a
  NUMBERS = (0..999).to_a
  MAX_NAMES = LETTERS.length * NUMBERS.length

  @@name_count = 0

  private

  attr_writer :name

  def initialize
    self.name = "%<letters>s%<numbers>03d" %
     {letters: LETTERS[@@name_count / 1000],
     numbers: NUMBERS[@@name_count % 1000]}
    @@name_count += 1
    Robot.forget if @@name_count == MAX_NAMES
  end

  def self.forget
    @@name_count = 0
  end

  alias reset initialize

  public

  public :reset

  attr_reader :name

end

