class Robot

  NAMES = ('AA000'..'ZZ999').to_a.shuffle
  MAX_NAMES = NAMES.length 

  def self.forget
    @@name_count = 0
  end

  @@name_count = 0

  private

  attr_accessor :name

  def initialize
    self.name = NAMES[@@name_count] and @@name_count += 1
    Robot.forget if @@name_count == MAX_NAMES
  end

  alias reset initialize

  public :reset, :name

end

