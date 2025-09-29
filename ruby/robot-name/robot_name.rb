class Robot

  NAMES = ('AA000'..'ZZ999').to_a.shuffle
  MAX_NAMES = NAMES.length

  private

  def self.forget
    @@name_count = 0
  end

  attr_accessor :name

  def initialize
    Robot.forget unless @@name_count
    self.name = NAMES[@@name_count] and @@name_count += 1
    Robot.forget if @@name_count == MAX_NAMES
  end

  alias reset initialize

  public :reset, :name

end

