class Robot

  NAMES = ('AA000'..'ZZ999').to_a.shuffle
  MAX_NAMES = NAMES.length 

  @@name_count = 0

  private

  attr_writer :name

  def initialize
    self.name = NAMES[@@name_count]
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

