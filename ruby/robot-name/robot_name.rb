class Robot

  NAMES = ('AA000'..'ZZ999').to_a.shuffle
  MAX_NAMES = NAMES.length

  private

  def self.forget
    @@name_count = 0
  end

  attr_accessor :name

  def initialize
    self.name = NAMES[@@name_count] and @@name_count += 1
  end

  alias reset initialize

  public :reset, :name

end

